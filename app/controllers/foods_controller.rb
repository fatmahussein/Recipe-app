class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods
  end

  def show
    @user = User.find(params[:user_id])
    @food = @user.foods.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = Food.new(foods_param)
    @food.user = @user

    if @food.save
      flash[:notice] = 'Food was created successfully.'
      redirect_to root_path
    else
      flash.now[:error] = 'Oops, something went wrong'
      render :new
    end
  end

  def foods_param
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
