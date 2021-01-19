Rails.application.routes.draw do
  get 'worries/index'
  get 'worries/create'
  devise_for :users
  root to: 'homes#index'
  get 'homes/index'
  resources :objectives
end
