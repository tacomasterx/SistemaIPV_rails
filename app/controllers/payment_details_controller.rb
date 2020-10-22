class PaymentDetailsController < ApplicationController
  before_action :authenticate_user!

  def create
    sale_session = SaleSession.where(employee_id: current_user.employee_id).last
    unless SaleSession.where(employee_id: current_user.employee_id).any? then
      redirect_to new_sale_path
    end
    @sale = Sale.find(sale_session.sale_id)
    #@payment_detail = PaymentDetail.new( payment_detail_params )
    @payment_detail = PaymentDetail.new(payment: params[:payment_detail][:payment])
    @payment_detail.sale_id = @sale.id
    respond_to do |format|
      if @payment_detail.save
        sell_inventory_items (@sale)
        #@sale.destroy_sale_session
        SaleSession.where(employee_id: current_user.employee_id).destroy_all
        format.html { redirect_to @sale, notice: 'Venta concluída.' }
        format.json { render :show, status: :ok, location: @payment_detail }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @payment_detail.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def sell_inventory_items (sale)
    inventory_items = sale.inventory_items
    inventory_items.each do |item|
      unless item.update(product_status_id: 4) then
        puts "\n\n#{item.errors}\n\n"
      end
    end
  end

end
