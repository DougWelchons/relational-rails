Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/members', to: 'members#index'
  
  get 'libraries', to: 'libraries#index'
  get 'libraries/:id', to: 'libraries#show'
end
