Rails.application.routes.draw do
  get '/login', to: 'auth#login'
  post '/signup', to: 'auth#signup'

  get '/adms', to: 'adms#index'
  get '/adms/:id', to: 'adms#show'
  post '/adms', to: 'adms#create'
  put '/adms/:id', to: 'adms#update'
  delete '/adms/:id', to: 'adms#delete'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#delete'

  get '/messages', to: 'messages#index'
  get '/messages/:id', to: 'messages#show'
  post '/messages', to: 'messages#create'
  put '/messages/:id', to: 'messages#update'
  delete '/messages/:id', to: 'messages#delete'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
