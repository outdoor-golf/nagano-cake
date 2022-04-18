class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @genres = Genre.all
  end
  def show
    @food = Food.find(params[:id])
    @cart_food = CartFood.new
    @genres = Genre.all
  end
end
