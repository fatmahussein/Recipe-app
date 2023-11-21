class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipefoods
    has_many :foods, through: :recipefoods
  
    validates :name, presence: true, length: { maximum: 100 }
    validates :preparation_time, :cooking_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :description, presence: true
end