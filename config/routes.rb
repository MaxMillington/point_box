Rails.application.routes.draw do
  resources :rewards
  resources :users

  namespace :admin do
    resources :categories
  end

  get "/logout", to: "sessions#destroy"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  root 'users#index'

end
