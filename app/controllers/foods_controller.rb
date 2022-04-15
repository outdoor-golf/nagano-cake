class FoodsController < ApplicationController
  def new
    @food = Food.new
    @genre = Genre.all

  end
  def create
  end
end
