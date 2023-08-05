Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'pages#home'

  get '/dashboard', to: 'projects#dashboard', as: :dashboard
  get '/next_question', to: 'questions#next_question'

  resources :buddies, only: %i[new create show update]
  resources :projects, only: %i[index new create show update]
end
