class ShoppingListController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @recipes = Recipe.includes(:recipe_foods).find(params[:recipe_id])
    @recipe_foods = @recipes.recipe_foods.includes(:food)
    @remaining_foods_price = remaining_foods_price(@recipes, current_user.foods)
    @missing_foods = missing_foods
  end

  private

  # def missing_foods
  #   user_food_ids = current_user.foods.pluck(:id)
  #   recipe_food_ids = @recipes.recipe_foods.pluck(:food_id)
  #   missing_food_ids = recipe_food_ids - user_food_ids
  #   Food.where(id: missing_food_ids)
  # end

  def missing_foods
    @user = current_user 
    @foods = @user.foods
    recipe_foods = @recipes.recipe_foods
    missing_items = []
    recipe_foods.each do |recipe_food|
      @foods.each do |food|
        missing_items << food if recipe_food.food == food
      end
    end
    @foods - missing_items
  end

  def remaining_foods_price(recipes, user_foods)
    total_foods_price = user_foods.sum(:price)
    total_recipe_foods_price = recipes.recipe_foods.includes(food: {}).sum('foods.price')
    total_foods_price - total_recipe_foods_price
  end
end
