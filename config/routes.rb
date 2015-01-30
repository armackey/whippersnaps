Rails.application.routes.draw do

  root "sessions#new"
  post "/login" => "sessions#create", as: :login
  get "/login" => "sessions#new"
  delete "/logout" => "sessions#destroy"
  resources :users
  delete "/users/:id" => "users#destroy", as: :delete_user
  resources :photos
end
