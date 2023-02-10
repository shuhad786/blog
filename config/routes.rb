Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :update, :destroy] do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:create, :index]
      end
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      post '/likes', to: 'likes#create', as: 'likes'
    end
  end
end
