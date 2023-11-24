class RecipesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show]
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  
    def index
      @user = current_user
      @recipes = Recipe.includes(:foods).all
    end
  
    def show
      # Already found the recipe in before_action
      @recipe_foods = @recipe.recipe_foods.includes(:food)
    end
  
    def new
      @recipe = Recipe.new
    end
  
    def create
      @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
        redirect_to recipes_path, notice: 'Recipe was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      # Already found the recipe in before_action
    end
  
    def update
      if @recipe.update(public: !@recipe.public)
        redirect_to @recipe, notice: 'Recipe was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
    end
  
    private
  
    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
  
    def recipe_params
      params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
    end
  end
  