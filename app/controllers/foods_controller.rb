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
  def show
    @food = Food.find(params[:id])
    # 消費税
    @tax = 1.1
  end
  def edit
    @food = Food.find(params[:id])
    @genre = Genre.all
  end
  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to foods_path
  end
  private
  def food_params
    params.require(:food).permit(:name,:explanation,:genre_id,:price,:sale_status)
  end
end
