Rails.application.routes.draw do
  resources :videos
  get 'videos/:id/view',
    to: 'videos#view',
    as: 'view_video',
    defaults: { format: 'json' }

  devise_for :users

  root to: "videos#index"
end
