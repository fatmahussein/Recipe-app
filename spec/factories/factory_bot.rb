FactoryBot.define do
    factory :user do
      name { 'Bk' }
      email { 'bkkk@gmail.com' }
      password { 'veryhard' }
    end
end

FactoryBot.define do
    factory :food do
      name { 'Vegis' }
      measurement_unit { 'gram' }
      price { 22 }
      quantity { 684 }
      user
    end
end

FactoryBot.define do
    factory :recipe do
      name { 'sww soup' }
      preparation_time { 5 }
      cooking_time { 6 }
      description { 'amazing' }
      public { true }
      user
    end
end


FactoryBot.define do
    factory :recipe_food do
      quantity { 77 }
    end
end

FactoryBot.define do
    factory :public_recipe, class: 'Recipe' do
      name { 'jolof rice' }
      preparation_time { 4 }
      cooking_time { 55 }
      description { 'should be public recipe' }
      public { true }
      user
    end
end