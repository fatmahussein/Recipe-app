require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'is valid with valid attributes' do
    food = Food.create(name: 'rice', measurement_unit: 'Grams', price: 200, quantity: 500)
    recipe = Recipe.create(name: 'biriani rice', user: User.new(email: 'altman@gmail.com', password: 'waiting', name: 'sam'))

    recipe_food = RecipeFood.new(quantity: 5, food:, recipe:)

    expect(recipe_food).to be_valid
  end

  it 'is associated with a food' do
    food = Food.create(name: 'rice', measurement_unit: 'Grams', price: 200, quantity: 500)
    recipe = Recipe.create(name: 'biriani rice', user: User.new(email: 'altman@gmail.com', password: 'waiting', name: 'sam'))

    recipe_food = RecipeFood.new(quantity: 8, food:, recipe:)

    expect(recipe_food.food).to eq(food)
  end

  it 'is associated with a recipe' do
    food = Food.create(name: 'rice', measurement_unit: 'Grams', price: 200, quantity: 500)
    recipe = Recipe.create(name: 'biriani rice', user: User.new(email: 'altman@gmail.com', password: 'waiting', name: 'sam'))

    recipe_food = RecipeFood.create(quantity: 9, food:, recipe:)

    expect(recipe_food.recipe).to eq(recipe)
  end
end
