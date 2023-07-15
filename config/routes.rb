Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"

  resources :splash, only: [:index]

  resources :categories, only: [:index, :show, :new, :create] do
    resources :transaction_entries, only: [:index, :new, :create]
  end
end
