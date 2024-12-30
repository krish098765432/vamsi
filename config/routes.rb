Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :friendships

  root to: "home#index"
    # Define the about route
    get 'about', to: 'home#about', as: 'about'

    # Define the contact route
    get 'contact', to: 'home#contact', as: 'contact'
      # Friendship routes
  post 'send_friend_request', to: 'friendships#send_request'
  post 'accept_friend_request/:friend_id', to: 'friendships#accept_request', as: 'accept_friend_request'
  post 'reject_friend_request/:friend_id', to: 'friendships#reject_request', as: 'reject_friend_request'
    
# This sets the home page route to the index action in HomeController
  # You can add more routes below
  # get 'home/index'
end
