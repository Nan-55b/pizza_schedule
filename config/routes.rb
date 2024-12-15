Rails.application.routes.draw do
  root 'pages#index'

  resources :users, only: %i[new create edit update]
  resources :schedules, only: %i[index new create show]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
