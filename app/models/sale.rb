class Sale < ApplicationRecord
  belongs_to :shop
  belongs_to :employee
  has_many :sale_sessions
  has_many :payment_details
  has_many :transactions
  has_many :inventory_items, through: :transactions

  def create_sale_session
    SaleSession.find_or_create_by(sale: self, employee_id: self.employee_id)
  end

  def  destroy_sale_session
    SaleSession.where(employee_id: current_user.employee_id).destroy_all
  end

end
