class Recipefood < ActiveRecord::Migration[7.1]
  def change
    create_table :recipefood do |t|
      t.integer :quantity
      t.references :recipe, foreign_key: { to_table: 'recipe' }
      t.references :food, foreign_key: { to_table: 'food' }
      t.timestamps
    end
  end
end
