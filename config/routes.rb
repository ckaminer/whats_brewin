Rails.application.routes.draw do

  root to: "breweries#index"

  resources :users, only: [:new, :create, :show]

  resources :breweries, only: [:index, :show]

  resources :beers, only: [:index, :show] do
    resources :ratings, only: [:create, :update]
  end

  resources :styles, only: [:index, :show]

  namespace :admin do
    resources :breweries
    resources :beers
    resources :styles
  end

  post '/breweries', to: 'admin/breweries#create'
  patch '/breweries/:id', to: 'admin/breweries#update'

  post '/styles', to: 'admin/styles#create'
  patch '/styles/:id', to: 'admin/styles#update'

  post '/beers', to: 'admin/beers#create'
  patch '/beers/:id', to: 'admin/beers#update'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
