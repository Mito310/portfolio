Rails.application.routes.draw do
  post 'seiseki/index'
  get 'seiseki/:id', to: 'seiseki#detail'
  post 'seiseki/:id', to: 'seiseki#detail'

  get 'results/result'

  resources :choices
  resources :results
  resources :records
  get 'exams/create'
  post 'exams/create'

  resources :exams
  resources :questions
  resources :fields
  resources :subjects
  post 'seiseki/index'
  get 'seiseki/:id', to: 'seiseki#detail'
  post 'seiseki/:id', to: 'seiseki#detail'

  get 'results/result'


  get 'exams/create'
  post 'exams/create'
  get 'exams/show'
  get 'exams/delete'
  post 'exams/delete'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
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

  post 'select/test'

end
