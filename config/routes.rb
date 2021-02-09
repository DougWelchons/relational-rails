Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/members', to: 'members#index'
  
  get '/libraries/new', to: 'libraries#new'
  post '/libraries/new', to: 'libraries#create'
  get '/libraries', to: 'libraries#index'
  get '/libraries/:id', to: 'libraries#show'
  patch '/libraries/:id', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#destroy'
  get '/libraries/:id/edit', to: 'libraries#edit'
  
  get '/libraries/:id/books/new', to: 'books#new'
  post '/libraries/:id/books', to: 'books#create'
  get '/libraries/:id/books/:sort', to: 'books#index'
  
  get '/libraries/:id/books', to: 'books#index'
  # post '/libraries/:id/books', to: 'books#index'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'

  # resources :libraries do
  #   resources :books
  # end
end
