class FoodsController < ApplicationController
  def new
    @food = Food.new
    @genre = Genre.all

  end
  def create
    food = Food.new(food_params)
    food.save
    redirect_to new_food_path
  end
  def index
    @foods = Food.all
  end
  private
  def food_params
    params.require(:food).permit(:name,:explanation,:genre_id,:price,:sale_status)
  end
end
