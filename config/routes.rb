Rails.application.routes.draw do
  
  root 'giantstep#index'
  resources :giantstep, only: :index

end
