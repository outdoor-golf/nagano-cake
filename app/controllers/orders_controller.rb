class OrdersController < ApplicationController

  def new
    @orders = Order.all
    
  end

  def create
    current_customer.orders.create(order_params)
    redirect_to confirm_orders_path
  end
  
  

  def index

  end

  def show

  end



  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_price, :payment_method, :total_price, :status)
  end
end
