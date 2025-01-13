# The priority is based upon order of creation: first created -> highest priority.
Rails.application.routes.draw do
  # match "/404", :to => "application#routing_error", :via => :all
  # match "/500", :to => "application#routing_error", :via => :all

  # Note: This route will make all actions in every controller accessible via GET requests.
  
  
  root 'weather#index'
  
  post 'fetch_forecast', to: 'weather#fetch_forecast'

  match "fetch_forecast", controller: "weather", action: "fetch_forecast", via: %i[get post]
end
