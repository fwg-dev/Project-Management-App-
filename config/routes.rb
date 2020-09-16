Rails.application.routes.draw do

   get '/' => 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#google'

  resources :my_projects, only: [:new, :create, :update, :index]

  
  resources :tasks
  resources :projects do 
    resources :tasks, only: [:new, :create, :index]
  end
  
  resources :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end