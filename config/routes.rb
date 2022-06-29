Rails.application.routes.draw do
  resources :results
  resources :records
  get 'exams/create'
  post 'exams/create'
  get 'exams/show'
  get 'exams/delete'
  post 'exams/delete'
  resources :choices
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #メニュー画面
  get 'select', to: 'select#menu'

  #理科ボタン
  get 'select/science'
  post 'select/science'

  #社会ボタン
  get 'select/social_study'
  post 'select/social_study'

  #分野選択画面
  get 'select/select'

  get 'exams/create', to: 'exams#create'
  post 'exams/create', to: 'exams#create'

  get 'exams/choice'
  post 'exams/choice'

  get 'exams/answer'
  post 'exams/answer'


  get 'exams/:id', to: 'exams#show'
  post 'exams/:id', to: 'exams#show', as: 'next'

  get 'fields/add/', to: 'fields#add'
  post 'fields/add', to: 'fields#create'
  get 'fields/index'
  get 'fields/:id', to: 'fields#show'
  get 'fields/edit/:id', to: 'fields#edit'
  post 'fields/edit/:id', to: 'fields#update'
  get 'fields/delete/:id', to: 'fields#delete'
  post 'select/test'
end
