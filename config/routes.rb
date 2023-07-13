Rails.application.routes.draw do
  get 'transactions/new'
  get 'categories/new'
  get 'home/index'
  get 'splash/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
