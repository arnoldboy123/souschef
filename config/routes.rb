Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users do
    resources :friend_requests
  end

  root to: 'pages#home'

  resources :recipes do
    member do
      get :mark_done
    end
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
  resources :posts, only: [:index, :new, :create] do
    resources :comments, only: [:create]
  end
end
