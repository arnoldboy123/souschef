Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  resources :recipes
  resources :planned_recipes, only: [:create, :index, :edit, :update, :show] do
    collection do
      post :planner
      get :planner
    end
  end
  resources :fridge_items, path: "my_fridge", only: [:index, :new, :create, :edit, :update, :destroy]
end
