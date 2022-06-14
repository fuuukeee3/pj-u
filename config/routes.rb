Rails.application.routes.draw do
  root "photos#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :photos, only: [:index, :new, :create]
  resources :tweets, only: [:create]

  get '/oauth/callback', to: "oauth#callback"
end
