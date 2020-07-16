Rails.application.routes.draw do
  get '/owners/new', to: 'owners#new', as: 'new_owner'
  root 'static#home'
  get '/owners', to: 'owners#index', as: 'owners'
  post '/owners', to: 'owners#create'
  get '/owners/:id', to: 'owners#show', as: 'owner'
  get '/owners/:id/edit', to: 'owners#edit', as: 'edit_owner'
  patch '/owners/:id', to: 'owners#update'
  delete '/owners/:id', to: 'owners#destroy'
  get '/login', to: 'session#new', as: "login"
  get '/session', to: 'static#home'
  post '/session', to: 'session#create'
  delete '/session/', to: 'session#delete', as: 'logout'
  match '/auth/google_oauth2/callback', to: 'session#create', via: [:get, :post]
  get '/owners/:id/guns/new', to: 'guns#new', as: 'new_gun'
  post '/owners/:id/guns', to: 'guns#create', as: 'create_gun'
  get '/owners/:id/guns', to: 'owners#guns_index', as: 'owners_guns'
  get '/owners/:id/guns/:id', to: 'guns#show', as: 'show_gun'
  get '/owners/:id/guns/:id/edit', to: 'guns#edit', as: 'edit_gun'
  patch '/owners/:id/guns/:id', to: 'guns#update'
  resources :owners, only: [:show, :index] do
    resources :ammunition
    resources :gun
  end
  resources :guns
  get 'owners/:id/ammunitions/new', to: 'ammunitions#new', as: 'new_ammo'
  post 'owners/:id/ammunitions/new', to: 'ammunitions#create'
  get 'owners/:id/ammunitions', to: 'ammunitions#index', as: 'all_ammo'
  get '/owners/:id/ammunitions/:ammunition_id', to: 'ammunitions#show', as: 'show_ammo'
  get '/owners/:id/ammunitions/:ammunition_id/edit', to: 'ammunitions#edit', as: 'edit_ammo'
  patch '/owners/:id/ammunitions/:ammunition_id', to: 'ammunitions#update', as: 'ammunition'
end
