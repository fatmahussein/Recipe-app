class RecipeFoodsController < ApplicationController
  before_action :find_recipe_food, only: %i[show edit update destroy]

  def index
    @recipe_foods = RecipeFood.includes(:recipe, :food).all
  end

  def show
    # Already found the recipe food in before_action
  end

  def new
    @user = current_user
    @foods = @user.foods
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.new(recipe_food_params)
    @recipe_foods.recipe = @recipe
    if @recipe_foods.save
      redirect_to recipe_path(@recipe), notice: 'Recipe Food was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Already found the recipe food in before_action
    @user = current_user
    @foods = @user.foods
  end

  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to @recipe_food, notice: 'Recipe Food was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to recipe_foods_url, notice: 'Recipe Food was successfully destroyed.'
  end

  private

  def find_recipe_food
    @recipe_food = RecipeFood.includes(:recipe, :food).find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
