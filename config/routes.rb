Rails.application.routes.draw do
  get 'rules/index'
  devise_for :users
  root to: 'homes#index'
  get 'homes/index'
  resources :objectives
  resources :troubles
  resources :habits
end
