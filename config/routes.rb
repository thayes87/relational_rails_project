Rails.application.routes.draw do

  get '/cycle_shops', to: 'cycle_shops#index' 
  get '/cycle_shops/new', to: 'cycle_shops#new'
  get '/cycle_shops/:id', to: 'cycle_shops#show'
  get '/bikes', to: 'bikes#index'
  get '/bikes/:id', to: 'bikes#show'
  get '/cycle_shop/:id/bikes', to: 'cycle_shop_bikes#index'
  post '/cycle_shops', to: 'cycle_shops#create'
end