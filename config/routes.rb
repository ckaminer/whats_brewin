Rails.application.routes.draw do
  resources :breweries, only: [:index, :new, :create, :show]
end
