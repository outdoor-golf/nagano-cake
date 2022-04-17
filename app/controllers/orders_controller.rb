class OrdersController < ApplicationController

  def new
    @new_order = Order.new
    @adress = Adress.new
    @adresses = current_customer.adress.all
  end

  def confirm

  end

  def create
  end

  def index
    @orders = current_customer.orders
  end

  def show
   @order = Order.find(params[:id])
  end

  private
end
