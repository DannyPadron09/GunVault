Rails.application.routes.draw do
  get '/owners/new', to: 'owners#new', as: 'new_owner'
  root 'static#home'
  get '/owners', to: 'owners#index', as: 'owners'
  post '/owners', to: 'owners#create'
  get '/owners/:id', to: 'owners#show', as: 'owner'
  get '/owners/:id/edit', to: 'owners#edit', as: 'edit_owner'
  patch '/owners/:id', to: 'owners#update'
  get '/login', to: 'session#new', as: "login"
  get '/session', to: 'static#home'
  post '/session', to: 'session#create'
  delete '/session/', to: 'session#destroy', as: 'logout'
  match '/auth/google_oauth2/callback', to: 'session#create', via: [:get, :post]
  get '/owners/:id/guns/new', to: 'guns#new', as: 'new_gun'
  post '/owners/:id/guns', to: 'guns#create', as: 'create_gun'
  get '/owners/:id/guns', to: 'owners#guns_index', as: 'owners_guns'
  # post '/owners/:id/guns/:guns_id', to: 'owners#gun'
  resources :owners, only: [:show, :index] do 
    resources :gun, only: [:show, :index, :new, :create]
  end
  resources :gun
  get 'owners/:id/ammo/new', to: 'ammunitions#new', as: 'new_ammo'
  post 'owners/:id/ammo/new', to: 'ammunitions#create'
  get 'owners/:id/ammo', to: 'ammunitions#index', as: 'all_ammo'
end
