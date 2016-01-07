Rails.application.routes.draw do
  resources :listings
  resources :companies
  resources :admins
  resources :admin_sessions, only: [:new, :create, :destroy]

  get "login" => "admin_sessions#new"
  get "logout" => "admin_sessions#destroy"
end
