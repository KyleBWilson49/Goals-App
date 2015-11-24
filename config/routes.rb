Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals

  root to: "sessions#new"
end
