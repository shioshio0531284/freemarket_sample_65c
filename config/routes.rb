Rails.application.routes.draw do
  root 'items#index'

  resources :users, only: %i[:new, :index] do
    collection do
      get 'mypage'
      get '_logout'
      get '_side-bar'
      get '_card_registration'
    end
  end
end