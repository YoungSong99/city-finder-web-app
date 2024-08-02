Rails.application.routes.draw do

  devise_for :users
  root to: redirect('/search')
  get 'dashboard', to: 'dashboard#index'
  post 'dashboard', to: 'dashboard#index'
  get 'search', to: 'dashboard#search', as: 'search'
  get 'search/cities/:id', to: 'cities#show', as: 'search_city'
  get 'comparison', to: 'dashboard#comparison_search', as: 'comparison'
  post '/cities/add/:id', to: 'dashboard#add', as: 'add_city'
  delete '/cities/add/:id', to: 'dashboard#remove', as: 'remove_city'
  get '/cities/comparison_result', to: 'dashboard#comparison_result', as: 'comparison_result'

  resources :cities, only: [:show]

  resources :cities do
    resources :reviews, only: [:new, :create, :index, :show]
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
