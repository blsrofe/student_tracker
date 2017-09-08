Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :teachers, only: [:new, :create, :show, :edit, :update] do
    resources :sections, only: [:new, :create, :index]
  end

  resources :sections, only: [:show] do
    resources :students, only: [:new, :create, :index]
  end

  resources :students, only: [:show] do
    resources :observations, only: [:new, :create, :index]
  end

  delete "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
