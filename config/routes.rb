Rails.application.routes.draw do
  get 'users/add_friends'
  get 'users/pending_requests'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"

  resources :friendships, only: [:create, :update, :destroy]
  resources :posts, only: [:index, :new, :create, :show]
  resources :users, only: [:show]

  resources :posts do
    post 'like', on: :member
    post 'dislike', on: :member
    post 'comment', on: :member
    post 'delete_comment', on: :member
  end
end
