Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users

  resources :groups, only: [:index, :new, :create] do
    resources :purchases, only: [:index, :new, :create ]
  end
  
  root "groups#index"

end
