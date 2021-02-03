Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/members', to: 'members#index'
  get '/members/new', to: 'members#new'
  get '/members/:id', to: 'members#show'
  post '/members', to: 'members#create'
  get '/members/:id/edit', to: 'members#edit'
  patch 'members/:id', to: 'members#update'
  get '/members/:id/destroy', to: 'members#destroy'
end
