Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  resources :recipes do
    member do
      get :mark_done
    end
    resources :reviews, only: %i[new create edit update]
  end
  resources :planned_recipes, only: [:create, :index, :edit, :update, :show] do
    collection do
      post :planner
      get :planner
      get :shopping_list
    end
  end
  resources :fridge_items, path: "my_fridge", only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      get :add
    end
  end
end
