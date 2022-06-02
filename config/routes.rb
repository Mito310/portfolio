Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #メニュー画面
  get 'select/menu'

  #理科ボタン
  get 'select/science'
  post 'select/science'

  #社会ボタン
  get 'select/social_study'
  post 'select/social_study'

  #分野選択画面
  get 'select/select'

  get 'fields/add/', to: 'fields#add'
  post 'fields/add', to: 'fields#create'
  get 'fields/index'
  get 'fields/:id', to: 'fields#show'
  get 'fields/edit/:id', to: 'fields#edit'
  post 'fields/edit/:id', to: 'fields#update'
  get 'fields/delete/:id', to: 'fields#delete'
  post 'select/test'
end
