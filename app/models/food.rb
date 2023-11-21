class Food < ApplicationRecord
  belongs_to :user
  has_many :recipefoods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :measurement_unit, presence: true, length: { maximum: 50 }
  validates :price, :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
