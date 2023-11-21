class Recipe < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.text :description
      t.boolean :public
      t.references :user, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end

end
