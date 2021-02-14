Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  get 'homes/index'
  resources :objectives
  resources :troubles, only: [:index, :new, :create]
  resources :habits, only: [:index, :new, :create]
  resources :rules, only: [:index, :create, :edit, :update]
end
