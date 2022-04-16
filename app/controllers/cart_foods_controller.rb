class CartFoodsController < ApplicationController
  def create
    @food = Food.find(cart_food_params[:food_id])
    cart_food = CartFood.new(cart_food_params)
    cart_food.user_id = current_customer.id
    cart_food.save
  end
   private
  def cart_food_params
      params.require(:cart_food).permit(:food_id, :quantity)
  end
end
