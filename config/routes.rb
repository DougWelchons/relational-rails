Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/members', to: 'members#index'
  
  get '/libraries/new', to: 'libraries#new'
  post '/libraries/new', to: 'libraries#create'
  get '/libraries', to: 'libraries#index'
  get '/libraries/:id', to: 'libraries#show'
  patch '/libraries/:id', to: 'libraries#update'
  get '/libraries/:id/edit', to: 'libraries#edit'

end
