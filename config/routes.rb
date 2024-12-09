Rails.application.routes.draw do
  get 'hello_koyeb/index'

  root 'hello_koyeb#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
