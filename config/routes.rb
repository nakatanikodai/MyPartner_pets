Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
  
  post 'posts', to: 'posts#index'

  resources :users, only: :show
end


