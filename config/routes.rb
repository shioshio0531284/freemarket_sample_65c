Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users_addresses', to: 'users/registrations#new_users_address'
    post 'users_addresses', to: 'users/registrations#create_users_address'
  end
  root 'items#index'
  resources :items
end
