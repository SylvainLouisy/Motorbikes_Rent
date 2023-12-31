Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "motorbikes#index"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :motorbikes
  resources :motorbikes, except: %i[edit update] do
    resources :bookings, only: %i[create]
    resources :reviews, only: :create
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy

end
