class CartFoodsController < ApplicationController
  def create
    # food = Food.find(cart_food_params[:food_id])
    cart_food = CartFood.new(cart_food_params)
    cart_food.customer_id = current_customer.id
    cart_food.save
    redirect_to foods_path
  end
  def index
    @cart_foods = current_customer.cart_foods

  end
  def update
    cart_food = CartFood.find(params[:id])
    cart_food.update(cart_food_params)
    redirect_to cart_foods_path
  end
  def destroy
    cart_food = CartFood.find(params[:id])
    cart_food.destroy
    redirect_to cart_foods_path
  end
  def destroy_all
    current_customer.cart_foods.destroy_all
    redirect_to cart_foods_path
  end


  private
  def cart_food_params
      params.require(:cart_food).permit(:food_id, :quantity)
  end
end
