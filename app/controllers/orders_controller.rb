class OrdersController < ApplicationController

  def new
    @new_order = Order.new
    @orders = Order.all
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def create
    current_customer.orders.create(order_params)
    redirect_to confirm_orders_path
  end

  def confirm
        params[:payment_method] = params[:payment_method].to_i
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.shipping_price = 800
        @cart_foods = current_customer.cart_foods
        @order.total_price = 0
        @cart_foods.each do |cart_food|
            @order.total_price+= cart_food.item.add_tax_price * cart_food.amount
        end
        if  params[:order][:address] == "0"
            @order.address = current_customer.address
            @order.name = current_customer.last_name + current_customer.first_name
            @order.postal_code = current_customer.postal_code
        elsif params[:order][:address_option] == "1"
            @order.address = Address.find(params[:order][:address_id]).address
            @order.name = Address.find(params[:order][:address_id]).name
            @order.postal_code = Address.find(params[:order][:address_id]).postal_code
        elsif params[:order][:address_option] == "2"
            @address = Address.new(address_params)
            @address.customer_id = current_customer.id
            @address.postal_code = params[:order][:postal_code]
            @address.address = params[:order][:address]
            @address.name = params[:order][:name]
            if @address.save
                @order.address = @address.address
                @order.name = @address.name
                @order.postal_code = @address.postal_code
            else
                render :new
            end
        end
  end

  def index
     @orders = current_customer.orders
  end

  def show

  end



  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_price, :payment_method, :total_price, :status)
  end
end
