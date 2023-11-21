class Food < ActiveRecord::Migration[7.1]
  def change
    create_table :food do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price
      t.integer :quantity
      t.references :user, foreign_key: { to_table: 'users' }
      t.timestamps
    end
   end
end
