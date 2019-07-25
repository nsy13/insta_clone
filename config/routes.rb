Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  resources :users, only: [:show]
  resources :posts, only: [:index, :create, :show, :destroy]
end