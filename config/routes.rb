Rails.application.routes.draw do

  root to: "breweries#index"

  resources :users, only: [:new, :create, :show]

  resources :breweries, only: [:index, :show]

  resources :beers, only: [:index, :show] do
    resources :ratings, only: [:create, :update]
  end

  resources :styles, only: [:index, :show]

  namespace :admin do
    resources :breweries, only: [:index, :new, :create, :show, :edit, :update]
    resources :beers, only: [:new]
    resources :styles, only: [:new]
  end

  # resources :admin do
  #   resources :breweries, only: [:new, :create, :edit, :update]
  #   resources :beers, only: [:new]
  #   resources :styles, only: [:new]
  # end

  post '/breweries', to: 'admin/breweries#create'
  patch '/breweries/:id', to: 'admin/breweries#update'

  post '/beers', to: 'admin/beers#create'

  post '/styles', to: 'admin/styles#create'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
