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

  resources :users, only: [:new, :index] do
    collection do
      get 'mypage'
      get '_logout'
      get '_side-bar'
      get '_card_registration'
    end
  end

  resources :signups, only: [:index] do
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
