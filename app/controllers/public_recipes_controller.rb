class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @public_recipes = Recipe.includes(:user, :recipe_foods, :foods).where(public: true).order(created_at: :desc)
    @recipe_food_counts = count_recipe_food_items
    @total_recipe_food_price = calculate_total_recipe_food_price
  end

  private

  def count_recipe_food_items
    recipe_food_counts = []
    @public_recipes.each do |recipe|
      recipe_food_counts << { recipe_id: recipe.id, recipe_food_count: recipe.recipe_foods.size }
    end
    recipe_food_counts
  end

  def calculate_total_recipe_food_price
    total_recipe_food_price = []
    @public_recipes.each do |recipe|
      total_price = recipe.foods.sum(:price)
      total_recipe_food_price << { recipe_id: recipe.id, total_food_price: total_price }
    end
    total_recipe_food_price
  end
end
