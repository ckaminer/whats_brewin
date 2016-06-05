Rails.application.routes.draw do

  root to: "breweries#index"

  resources :breweries, only: [:index, :show]

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :breweries, only: [:new]
  end

  post '/breweries', to: 'admin/breweries#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
