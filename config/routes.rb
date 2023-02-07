Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create, :new]
      post '/likes', to: 'likes#create', as: 'likes'
    end
  end
end
