Rails.application.routes.draw do
  root 'static_pages#home'
  get '/terms_of_service', to: 'static_pages#terms', as: :terms
  patch 'readed', to: 'notifications#readed'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  resources :users, only: [:show]
  resources :posts, only: [:new, :index, :create, :show, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :notifications, only: [:index]
  resources :relationships, only: [:create, :destroy]
end