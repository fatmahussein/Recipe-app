class RenameRecipefoodsToRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    rename_table :recipefoods, :recipe_foods
  end
end
