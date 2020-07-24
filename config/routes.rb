Rails.application.routes.draw do
  root 'static#home'
  get '/login', to: 'session#new', as: "login"
  get '/session', to: 'static#home'
  post '/session', to: 'session#create'
  delete '/session/', to: 'session#delete', as: 'logout'
  match '/auth/google_oauth2/callback', to: 'session#create', via: [:get, :post]
  resources :owners do
    resources :guns
    resources :ammunition
  end
  resources :guns
  resources :ammunitions
end
