Rails.application.routes.draw do
  root to: 'problem#index'
  devise_for :users
end
