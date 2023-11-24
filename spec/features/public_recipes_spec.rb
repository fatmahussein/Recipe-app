require 'rails_helper'

RSpec.feature 'Public Recipes Page', type: :feature do
  let!(:user) { create(:user) }
  let!(:recipe1) { create(:public_recipe, user: user) }
  let!(:recipe2) { create(:public_recipe, user: user) }

  before do
    visit public_recipes_path
  end

  scenario 'displaying public recipes' do
    expect(page).to have_content('Public Recipes')

    within('.pub-food') do
      expect(page).to have_css('.pub-none')

      expect(page).to have_link(recipe1.name, href: recipe_path(recipe1))
      expect(page).to have_link(recipe2.name, href: recipe_path(recipe2))

      expect(page).to have_content("By: #{user.name}")
      
      within(page.all('.content-here').first) do
        expect(page).to have_content("Total Items:")
        expect(page).to have_content("Total Price:")
      end

      within(page.all('.content-here').last) do
        expect(page).to have_content("Total Items:")
        expect(page).to have_content("Total Price:")
      end
    end
  end
end
