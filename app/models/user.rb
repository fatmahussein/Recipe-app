class User < ApplicationRecord
  has_many :food, dependent: :destroy
  has_many :recipe, dependent: :destroy

  validates :name, presence: true
end
