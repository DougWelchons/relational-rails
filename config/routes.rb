Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries', to: 'libraries#index'
  get '/libraries/:id', to: 'libraries#show'
  patch '/libraries/:id', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#destroy'
  get '/libraries/:id/edit', to: 'libraries#edit'
  
  get '/libraries/:id/books/new', to: 'books#new'
  post '/libraries/:id/books', to: 'books#create'
  get '/libraries/:id/books', to: 'books#index'
  get '/books', to: 'books#index'
  get '/libraries/:id/books/:sort', to: 'books#index'
  get '/books/search/:sort', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
  
  get '/members', to: 'members#index'
  get '/members/new', to: 'members#new'
  get '/members/:id', to: 'members#show'
  post '/members', to: 'members#create'
  get '/members/:id/edit', to: 'members#edit'
  patch 'members/:id', to: 'members#update'
  delete '/members/:id', to: 'members#destroy'
  get 'members/:id/offroad_vehicles', to: 'offroad_vehicles#index'
  get '/members/:id/new_orv', to: 'offroad_vehicles#new'

  get '/offroad_vehicles', to: 'offroad_vehicles#index'
  get '/offroad_vehicles/:id', to: 'offroad_vehicles#show'
  get '/offroad_vehicles/:id/edit', to: 'offroad_vehicles#edit'
  get '/offroad_vehicles/:id/destroy', to: 'offroad_vehicles#destroy'
  patch '/offroad_vehicles/:id', to: 'offroad_vehicles#update'
  post '/offroad_vehicles', to: 'offroad_vehicles#create'
end
