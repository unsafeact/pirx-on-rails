class OrdersController < ApplicationController

  before_action :authenticate_user!

  # CanCanCan helper
  load_and_authorize_resource
  
  def index
    @orders = Order.includes(:product).all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
