Rails.application.routes.draw do
  get 'objectives/index'
  get 'objectives/new'
  get 'objectives/create'
  devise_for :users
  root to: 'homes#index'
  get 'homes/index'
end
