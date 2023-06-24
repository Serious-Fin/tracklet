Rails.application.routes.draw do
  get 'user/add_friends'
  devise_for :users
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"

  resources :friendships, only: [:create]
end
