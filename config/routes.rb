Rails.application.routes.draw do

  resources :users
  resources :questions do
    resources :comments
    resources :answers
  end
  resources :sessions
  root to: "questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
