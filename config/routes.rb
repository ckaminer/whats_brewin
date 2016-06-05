Rails.application.routes.draw do

  root to: "breweries#index"

  resources :users, only: [:new, :create, :show]

  resources :breweries, only: [:index, :show]

  resources :beers, only: [:index, :show]

  namespace :admin do
    resources :breweries, only: [:new]
    resources :beers, only: [:new]
  end

  post '/breweries', to: 'admin/breweries#create'

  post '/beers', to: 'admin/beers#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
