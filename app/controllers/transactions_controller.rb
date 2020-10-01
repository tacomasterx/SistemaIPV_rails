class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    
  end

  def update

  end

  private

  def transaction_params
    params.require(:transaction).permit(:sale_id, :inventory_item_id, :amount)
  end

  def quantity_params
    params.require(:transaction).permit(:quantity)
  end

end
