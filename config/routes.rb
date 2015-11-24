Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals, only: [:new, :create, :index, :show]
  resources :user_comments, only: [:new,:create]
  resources :goal_comments, only: [:new,:create]

  root to: "sessions#new"
end
