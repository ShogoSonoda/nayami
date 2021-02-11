Rails.application.routes.draw do
  root to: 'problems#index'
  
  devise_for :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users#new_guest'
  end

  resources :problems do
    collection do
      get :search_problem
    end
    resources :answers, only: %i[new create]
  end

  resources :rooms, only: %i[index show new create] do
    collection do
      get :search_room
    end
    resources :messages, only: %i[index create]
    resource :room_users, only: %i[create destroy]
  end

  resources :users do
    collection do
      get :search_user
      get :mypage
    end
    member do
      get :user_problems
      get :user_rooms
    end
    resource :relationships, only: %i[create destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
