Rails.application.routes.draw do
  root 'pages#index'

  resources :users, only: %i[new create edit update]
  resources :schedules, only: %i[index new create show edit update destroy] do
    resources :tasks, only: %i[create edit update destroy toggle_complete calculate_task_position], shallow: true do
      member do
        patch :toggle_complete
      end
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
