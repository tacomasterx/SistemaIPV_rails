class RevenueController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: Agregar apartado de utilidades
    @shops = Shop.all
  end

end
