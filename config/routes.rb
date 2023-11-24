Rails.application.routes.draw do
  devise_for :users

  # Block where you can add custom routes or override default routes related to the User model within the Devise scope.
  # devise_scope :user do
  #   get '/users/sign_out', to: 'devise/sessions#destroy'
  
  # end
  resources :users, only: [:index, :show, :create, :destroy]
  resources :foods, only: %i[new create destroy]

  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update,:edit,:show]
  end

  # resources :food, only: [:index, :new, :create, :destroy] do
  #   resources :recipe, only: [:index, :new, :create]
  # end
  resources :shopping_list, only: [:index]
  resources :public_recipes, only: [:index]
  # Defines the root path route ("/")
  # root "posts#index"
  root 'foods#index'

  delete '/recipes/:recipe_id/recipe_foods/:id', to: 'recipe_foods#destroy', as: :delete_recipe_food
end
