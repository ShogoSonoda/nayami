Rails.application.routes.draw do
  root to: 'problems#index'
  devise_for :users
  resources :problems do
    resources :answers, only: :create
  end
end
