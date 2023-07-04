Rails.application.routes.draw do
  resources :bills
  resources :employees
  resources :clients
  resources :sessions

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/signup", to: "clients#create"
  get "/me", to: "clients#show"

end
