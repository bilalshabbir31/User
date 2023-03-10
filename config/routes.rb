Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "students#index"
  get '/students/', to: 'students#index', as: :students
  get 'students/new', to: 'students#new', as: :new_student
  post '/students/', to: 'students#create'
  delete '/students/:id', to: 'students#destroy', as: :student
  # resources :students, only: [:index,:new,:destroy,:create]
end
