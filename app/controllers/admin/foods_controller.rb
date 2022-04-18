class Admin::FoodsController < ApplicationController
  def new
    @food = Food.new
    @genre = Genre.all
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to admin_foods_path
    else
      @genre = Genre.all
      render "new"
    end
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
    redirect_to admin_foods_path
  end

  private
  def food_params
    params.require(:food).permit(:name,:explanation,:genre_id,:price,:sale_status,:image)
  end
end
