class SalesController < ApplicationController
  before_action :check_sale_session?, only: [:new, :create]
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
    unless SaleSession.where(employee_id: current_user.employee_id).any? then
      redirect_to new_sale_path
    end
      @transactions = @sale.transactions.all
      @payment_detail = PaymentDetail.new
  end

  # POST /sales
  # POST /sales.json
  def create
    # @sale = Sale.new(sale_params)
    @sale = current_user.employee.sales.new(sale_params)
    @sale.shop = current_user.employee.shop

    respond_to do |format|
      if @sale.save
        @sale.create_sale_session
         format.html { redirect_to edit_sale_path(@sale), notice: 'Sale was successfully created.' }
         format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    product_id = transaction_params[:inventory_item_id].to_i
    product_price =  get_price( '1', product_id )
    product_discount =  get_price( sale_params[:discount], product_id )
    case create_transaction product_id, product_discount, @sale
    when '0'
          sale_amount = @sale.amount + product_price
          sale_discount = @sale.discount + (product_price-product_discount)
          respond_to do |format|
            if @sale.update(amount: sale_amount, discount: sale_discount)
              format.html { redirect_to edit_sale_path(@sale), notice: 'Sale was successfully updated.' }
              format.json { render :show, status: :ok, location: @sale }
              #format.js
            else
              format.html { render :edit }
              format.json { render json: @sale.errors, status: :unprocessable_entity }
              #format.js
            end
          end
    when '1'
          respond_to do |format|
            format.html { redirect_to edit_sale_path(@sale), alert: 'No se pudo procesar la transacción.' }
            format.json { render :show, status: :unprocessable_entity, location: @sale }

          end
    when '2'
          respond_to do |format|
            format.html { redirect_to edit_sale_path(@sale), alert: 'No se pudo procesar la transacción: No hay artículos disponibles.' }
            format.json { render :show, status: :unprocessable_entity, location: @sale }

          end
    end
  end


  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:amount, :discount)
    end

    def payment_detail_params
      params.require(:payment_detail).permit(:payment)
    end

    def transaction_params
      params.require(:sale).permit(:inventory_item_id)
    end

    def get_price (discount, inventory_item)
      product = Product.find( transaction_params[:inventory_item_id] )
      sale_price = product.price_unit+(product.price_unit*product.profit)/100
      return case discount#params[:discount]
        when '1'
          sale_price
        when '2'
          sale_price-(sale_price*product.price_2)/100
        when '3'
          sale_price-(sale_price*product.price_3)/100
        when '4'
          sale_price-(sale_price*product.price_4)/100
        when '5'
          sale_price-(sale_price*product.price_5)/100
      end
    end

    def create_transaction (product, price, sale)
      if InventoryItem.where(product_id: product, product_status_id: 1, shop_id: current_user.employee.shop_id).any? then
        inventory_item = InventoryItem.where(product_id: product, product_status_id: 1, shop_id: current_user.employee.shop_id).first
        transaction = sale.transactions.new(amount: price, inventory_item_id: inventory_item.id)
        if transaction.save then
          inventory_item.update(product_status_id: 2)
          return '0'
        else
          return '1'
        end
      else
        return '2'
      end
    end



    def check_sale_session?
      if (current_user.employee.sale_sessions.any?) then
        redirect_to edit_sale_path(current_user.employee.sale_sessions.last.sale)
      end
    end

end
