class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @last_sale = current_user.employee.sales.last
    @sale_session = SaleSession.where(employee_id: current_user).first
  end
end
