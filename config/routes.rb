Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"
  get 'dashboard', to: 'dashboard#index'
  post 'dashboard', to: 'dashboard#index'

  resources :cities do
    resources :reviews, only: [:new, :create, :index, :show]
  end

  resources :reviews, only: [:edit, :update, :destroy]
end
