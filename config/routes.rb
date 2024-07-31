Rails.application.routes.draw do

  devise_for :users
  root "dashboard#main"
  get 'dashboard', to: 'dashboard#index'
  post 'dashboard', to: 'dashboard#index'
  get 'search', to: 'dashboard#search', as: 'search_cities'

  resources :cities do
    resources :reviews, only: [:new, :create, :index, :show]
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
