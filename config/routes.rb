Rails.application.routes.draw do
  root to: 'problems#index'

  devise_for :users

  # get '/problems/searchproblem', to: 'problems#search_problem'
  resources :problems do
    collection do
      get :search_problem
    end
    resources :answers, only: [:new, :create]
  end

  resources :rooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
    resource :room_users, only: [:create, :destroy]
  end

  # get '/users/searchuser', to: 'users#search_user'
  # get '/users/mypage', to: 'users#mypage'
  # get '/users/userproblems', to: 'users#user_problems'
  resources :users do
    collection do
      get :search_user
      get :mypage
    end
    member do
      get :user_problems
      get :user_rooms
    end
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

end
