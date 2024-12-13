Rails.application.routes.draw do
  root 'pages#index'
  resources :users, only: [:new, :create, :edit, :update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
