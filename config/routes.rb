Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'select/menu'
  get 'fields/add/', to: 'fields#add'
  post 'fields/add', to: 'fields#create'
  get 'fields/index'
  get 'fields/show'

end
