Rails.application.routes.draw do
  root to: 'problems#index'
  devise_for :users
  resources :problems do
    resources :answers, only: [:create]
  end
  resources :rooms, only: [:index, :show, :new, :create]　do
    resources :messages, only: [:index, :create]
  end
end
