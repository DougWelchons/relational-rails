Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/members', to: 'members#index'
  get '/members/new', to: 'members#new'
  get '/members/:id', to: 'members#show'
  post '/members', to: 'members#create'
  get '/members/:id/edit', to: 'members#edit'
  patch 'members/:id', to: 'members#update'
  get '/members/:id/destroy', to: 'members#destroy'
  get 'members/:id/offroad_vehicles', to: 'members#show_orv'
  get '/members/:id/new_orv', to: 'offroad_vehicles#new'

  get '/offroad_vehicles', to: 'offroad_vehicles#index'
  get '/offroad_vehicles/:id', to: 'offroad_vehicles#show'
  get '/offroad_vehicles/:id/edit', to: 'offroad_vehicles#edit'
  get '/offroad_vehicles/:id/destroy', to: 'offroad_vehicles#destroy'
  patch '/offroad_vehicles/:id', to: 'offroad_vehicles#update'
  post '/offroad_vehicles', to: 'offroad_vehicles#create'
end
