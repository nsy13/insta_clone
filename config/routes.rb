Rails.application.routes.draw do
  root 'static_pages#home'
  get '/users/:id/following', to: 'users#following', as: :following_user
  get '/users/:id/followers', to: 'users#followers', as: :followers_user
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  resources :users, only: [:show]
  resources :posts, only: [:index, :create, :show, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end