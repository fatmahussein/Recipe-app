require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:recipe_foods) }
  it { should have_many(:foods).through(:recipe_foods) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:preparation_time) }
  it { should validate_presence_of(:cooking_time) }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:preparation_time).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:cooking_time).is_greater_than_or_equal_to(0) }
end
