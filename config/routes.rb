Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :show, :edit, :update, :destroy]
  post 'posts', to: 'posts#index'
end


画像せんた