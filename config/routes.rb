Rails.application.routes.draw do
  get 'answers/new'

  get 'sessions/new'
  post 'sessions/login_attempt'

  resources :users
  resources :questions do
    resources :answers
  end
  resources :sessions
  root to: "questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
