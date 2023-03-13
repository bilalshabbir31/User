require 'sidekiq/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  get '/students/', to: 'students#index', as: :students
  get 'students/new', to: 'students#new', as: :new_student
  get '/students/:id', to: 'students#show'
  post '/students/', to: 'students#create'
  delete '/students/:id', to: 'students#destroy', as: :student
  root "students#index"
  mount Sidekiq::Web => '/sidekiq'
end
