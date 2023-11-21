class FoodsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @food = @user.food
  end

  def show
    @user = User.find(params[:user_id])
    @food = @user.food.find(params[:id])
  end
end
