Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users

  resources :groups, only: [:index, :new, :create]
  resources :purchases, only: [:index, :new, :create]
  

  root "groups#index"

end
