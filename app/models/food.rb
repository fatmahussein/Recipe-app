class Food < ApplicationRecord
  belongs_to :user
  has_many :recipefood, dependent: :destroy
  has_many :recipe, through: :recipefood, dependent: :destroy

  validates :name, :measurement_unit, :price, :quantity, presence: true
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }
end
