Rails.application.routes.draw do
  resources :register_classes
  resources :courses
  resources :students

  # Students
  post '/signup', to: 'students#create'
  get '/user', to: 'students#user'

  # Sessions
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
