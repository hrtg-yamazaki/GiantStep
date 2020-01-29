Rails.application.routes.draw do
  
  devise_for :users

  root 'giantstep#index'
  resources :giantstep, only: :index

end
