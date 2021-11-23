Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :recipes
  resources :planned_recipes, only: [:create, :index, :edit, :update, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fridge_items, path: "my_fridge", only: [:index, :new, :create, :edit, :update, :destroy]
end
