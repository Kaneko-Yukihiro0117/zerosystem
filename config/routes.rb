Rails.application.routes.draw do
  devise_for :users

  root "categories#index"

  resources :users, only: :show
  resources :blogs
  resources :shops
  resources :comments, only: [:new, :create] 
end
