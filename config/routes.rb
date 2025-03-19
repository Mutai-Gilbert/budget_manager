Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'reports/download', to: 'reports#create', defaults: { format: 'xlsx' }, as: :download_report

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  root "splash#index"
  
  resources :splash, only: [:index]
  resources :categories, only: [:index, :show, :new, :create] do
    resources :transaction_entries, only: [:index, :new, :create]
  end
end
