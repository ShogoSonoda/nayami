Rails.application.routes.draw do
  root to: 'problems#index'

  devise_for :users

  resources :problems do
    resources :answers, only: [:create]
  end

  resources :rooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
    resource :room_users, only: [:create, :destroy]
  end

  get '/users/searchuser', to: 'users#search_user'
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  get '/mypage' => 'users#mypage'
end
