Rails.application.routes.draw do
  get 'read', to: "demo#read"
  get 'read1', to: "demo#readone"
  get 'find', to: "demo#find"
  get 'findbyid/:id', to: "demo#findbyid"
  get 'findbycat/:id', to: "demo#findbycat"
  get 'findbyauth/:id', to: "demo#findbyauth"
  post 'create', to: "demo#create"
  put 'update', to:"demo#update"
  put 'update2', to:"demo#update2"
  delete 'deletebyid', to: "demo#deletebyid"

  post '/user/create', to: "user#create" 
  get '/signup', to: "user#new"
  get 'user/:id', to:"user#find"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
