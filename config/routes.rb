Rails.application.routes.draw do

  resources :ideas

  resources :users, only: [:new, :create]

  resource :sessions, only: [:new, :create, :destroy]

  root("ideas#index")
end
