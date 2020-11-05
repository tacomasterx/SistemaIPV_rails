class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /inventory_items
  # GET /inventory_items.json
  def index
    # Para el modo inventario de tienda específica
    #@inventory_items = InventoryItem.all
     @inventory_items = InventoryItem.where(shop_id: current_user.employee.shop_id)
  end

  # GET /inventory_items/1
  # GET /inventory_items/1.json
  def show
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new
  end

  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  # POST /inventory_items.json
  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    unless( inventory_item_params[:product_id] == '0' || inventory_item_params[:product_id] == nil ) then
        @inventory_item.original_cost = Product.find(inventory_item_params[:product_id]).price_unit
    end
    @inventory_item.shop_id = current_user.employee.shop_id
    @inventory_item.employee_id = current_user.employee_id
    @quantity = inventory_item_quantity[:quantity].to_i

    respond_to do |format|
      if @inventory_item.save
        if @quantity > 1 then
            (@quantity-1).times do |i|
              puts "\n\n\n#{i}\n\n\n"
              #@inventory_item.save
              InventoryItem.create( original_cost: @inventory_item.original_cost,  shop_id: @inventory_item.shop_id, product_id: @inventory_item.product_id, product_status_id: @inventory_item.product_status_id, employee_id: @inventory_item.employee_id)
            end
        end
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_items/1
  # PATCH/PUT /inventory_items/1.json
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_items/1
  # DELETE /inventory_items/1.json
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_items_url, notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ###UTILIDADES
# def revenue
# end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_item_params
      params.require(:inventory_item).permit( :shop_id, :product_id, :product_status_id, :employee_id)
    end

    def inventory_item_quantity
      params.require(:inventory_item).permit( :quantity )
    end
end
