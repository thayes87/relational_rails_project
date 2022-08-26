Rails.application.routes.draw do

  get '/cycle_shops', to: "cycle_shops#index" 
  get "cycle_shops/:id", to: "cycle_shops#show"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
