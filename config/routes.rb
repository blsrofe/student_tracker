Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :teachers, only: [:new, :create, :show, :edit, :update] do
    resources :sections, only: [:new, :create, :index]
  end

  resources :sections, only: [:show, :edit, :update, :destroy] do
    resources :students, only: [:new, :create]
  end

  resources :students, only: [:show, :destroy, :edit, :update] do
    resources :observations
  end

  namespace :admin do
    resources :students, only: [:index]
    resources :teachers, only: [:index, :show]
  end

  delete "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
