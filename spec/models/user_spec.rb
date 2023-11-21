require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'King') }

    before { subject.save }

    describe 'Associations' do
        it { should validate_presence_of(:name) }
    end

    describe 'Validations' do
        it 'is valid with valid attributes' do
            user = User.new(
              name: 'John Wick'
            )
            expect(user).to be_valid
        end
        
        it 'is not valid without a name' do
            user = User.new(name: nil)
            expect(user).to_not be_valid
        end
        
        it 'has many food' do
            user1 = User.new(name: 'John Wick')
            food1 = Food.new(name: 'Food 1', measurement_unit: 'Grams', price: 10.99, quantity: 500, user_id: user1.id)
            food2 = Food.new(name: 'Food 2', measurement_unit: 'Grams', price: 8.99, quantity: 300, user_id: user1.id)
        
            expect(user.food).to include(food1, food2)
        end
        
        it 'has many recipe' do
            user1 = User.new(name: 'John Wick')
            recipe1 = Recipe.new(name: 'Recipe 1', description: 'Description 1', preparation_time: 30, cooking_time: 60,
                                 user_id: user1.id)
            recipe2 = Recipe.new(name: 'Recipe 2', description: 'Description 2', preparation_time: 40, cooking_time: 50,
                                 user_id: user1.id)
        
            expect(user.recipe).to include(recipe1, recipe2)
          end
    end
end
