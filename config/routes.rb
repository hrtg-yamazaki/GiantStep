Rails.application.routes.draw do
  
  devise_for :users

  root 'giantstep#index'

  resources :giantstep, only: :index

  resources :mypage, only: :index

  resources :signup, only: :index do
    collection do
      post 'keep'
      get 'profile'
      post 'user_create'
      get 'complete'
    end
  end

end
