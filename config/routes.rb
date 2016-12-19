Rails.application.routes.draw do
  root "static_pages#home"
  get "signup"  => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users
  namespace :admin do
    resources :users, except: [:new, :create, :show]
    resources :categories
    resources :words, only: [:index, :new, :create]
  end
end
