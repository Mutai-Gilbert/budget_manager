Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
  
  resources :splash, only: [:index]
  resources :categories, only: [:index, :show, :new, :create] do
    resources :transaction_entries, only: [:new, :create, :index]
  end
  resources :reports, only: [] do
    collection do
      get :create
    end
  end
end
