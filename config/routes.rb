Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users_addresses', to: 'users/registrations#new_users_address'
    post 'users_addresses', to: 'users/registrations#create_users_address'
  end
  root 'items#index'

  resources :users, only: [:new, :index] do
    collection do
      get 'mypage'
      get '_logout'
      get '_side-bar'
      get '_card_registration'
    end
  end
end
