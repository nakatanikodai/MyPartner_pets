Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: [:new, :create]
  post 'posts/new', to: 'posts#new'
  get 'posts', to:'posts#index'
end
