class FoodsController < ApplicationController
  def new
    @food = Food.new
  end
  def create
  end
end
