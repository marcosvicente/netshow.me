Rails.application.routes.draw do
  resources :videos
  get 'videos/:id/view', to: 'videos#view', defaults: { format: 'json' }

  devise_for :users

  get 'home/index'
  root to: "home#index"

end
