require 'rails_helper'

RSpec.feature 'Recipes management', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit recipes_path
  end

  scenario 'User views recipe index page' do
    create(:recipe, user:)
    visit recipes_path

    expect(page).to have_content('Find your favourite recipe here')
    expect(page).to have_link('Add a Recipe')
  end

  scenario 'User adds a new recipe' do
    create(:recipe, user:)
    visit recipes_path

    click_link 'Add a Recipe'
    expect(page).to have_current_path(new_recipe_path)

    expect(page).to have_content('Add a new recipe')
  end

  scenario 'User views a specific recipe' do
    recipe = create(:recipe, user:)
    visit recipes_path

    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation Time: #{recipe.preparation_time} (mins)")
    expect(page).to have_content("Cooking Time: #{recipe.cooking_time} (mins)")
  end
end
