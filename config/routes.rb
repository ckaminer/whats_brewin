Rails.application.routes.draw do

  root to: "breweries#index"

  resources :users, only: [:new, :create, :show]

  resources :breweries, only: [:index, :show]

  resources :beers, only: [:index, :show]

  resources :styles, only: [:index, :show]

  namespace :admin do
    resources :breweries, only: [:new]
    resources :beers, only: [:new]
    resources :styles, only: [:new]
  end

  post '/breweries', to: 'admin/breweries#create'

  post '/beers', to: 'admin/beers#create'

  post '/styles', to: 'admin/styles#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
