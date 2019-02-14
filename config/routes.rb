Rails.application.routes.draw do
  resources :videos
  devise_for :users
  get 'home/index'
  root to: "home#index"

end
