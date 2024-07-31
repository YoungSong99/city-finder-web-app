Rails.application.routes.draw do

  devise_for :users
  root "dashboard#search"
  get 'dashboard', to: 'dashboard#index'
  post 'dashboard', to: 'dashboard#index'
  get 'search', to: 'dashboard#search', as: 'search_cities'

  resources :cities, only: [:show]
  resources :cities do
    resources :reviews, only: [:new, :create, :index, :show]
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
