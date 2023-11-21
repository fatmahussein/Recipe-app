class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipefood, dependent: :destroy
  has_many :food, through: :recipefood, dependent: :destroy

  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :preparation_time, :cooking_time, numericality: { greater_than_or_equal_to: 0 }
end
