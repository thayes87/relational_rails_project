Rails.application.routes.draw do

  get '/cycle_shops', to: 'cycle_shops#index' 
  get '/cycle_shops/new', to: 'cycle_shops#new'
  get '/cycle_shops/:id', to: 'cycle_shops#show'
  get '/bikes', to: 'bikes#index'
  get '/bikes/:id', to: 'bikes#show'
  get '/cycle_shop/:id/bikes', to: 'cycle_shop_bikes#index'
  post '/cycle_shops', to: 'cycle_shops#create'
  get '/cycle_shops/:id/edit', to: 'cycle_shops#edit'
  patch '/cycle_shops/:id', to: 'cycle_shops#update'
  get '/cycle_shop/:id/bikes/new', to: 'cycle_shop_bikes#new'
  post '/cycle_shop/:id/bikes', to: 'cycle_shop_bikes#create'
  get '/bikes/:id/edit', to: 'bikes#edit'
  patch '/bikes/:id', to: 'bikes#update'
  delete '/cycle_shops/:id', to: 'cycle_shops#delete'
  delete '/bikes/:id', to: 'bikes#delete'
end