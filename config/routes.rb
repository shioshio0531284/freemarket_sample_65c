Rails.application.routes.draw do
  root 'items#index'

  resources :users, only: [:new, :index] do
    collection do
      get 'mypage'
      get '_logout'
    end
  end
end