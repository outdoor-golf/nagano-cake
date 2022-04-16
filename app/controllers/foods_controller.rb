class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @genres = Genre.all
  end
  def show
    @food = Food.find(params[:id])
  end
end
