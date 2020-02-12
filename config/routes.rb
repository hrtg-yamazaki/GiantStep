Rails.application.routes.draw do
  
  devise_for :users

  root 'giantstep#index'

  resources :giantstep, only: :index

  resources :mypage, only: :index do
    collection do
      get "profile"
      get "yardstick"
      patch "yardstick_update"
    end
  end

  resources :signup, only: :index do
    collection do
      post 'keep'
      get 'profile'
      post 'user_create'
      get 'complete'
    end
  end

  resources :records, only: :index do
    collection do
      get "recorded"
      get "redirecting"
    end
  end
  resources :records, only: [:new, :create]

  resources :statuses, only: :index do
    collection do
      get "reflected"
      patch "calculate"
    end
  end

end
