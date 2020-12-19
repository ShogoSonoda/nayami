Rails.application.routes.draw do
  root to: 'problems#index'
  devise_for :users
end
