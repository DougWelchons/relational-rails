Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/members', to: 'members#index'
  
  get '/libraries/new', to: 'libraries#new'
  post '/libraries/new', to: 'libraries#create'
  get '/libraries', to: 'libraries#index'
  get '/libraries/:id', to: 'libraries#show'
  patch '/libraries/:id', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#delete'
  get '/libraries/:id/edit', to: 'libraries#edit'
  get '/libraries/:id/books', to: 'libraries#index_books'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
end
