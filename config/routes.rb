Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :splash, only: [:index]
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]
  resources :home, only: [:index] do
    resources :categories, only: %i[new create]
  end
  resources :transactions, only: %i[index new create]
  resources :categories, only: [] do
    resources :transactions, only: %i[index new create]
  end
end
