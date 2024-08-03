Rails.application.routes.draw do

  devise_for :users

  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'

  get 'search', to: 'dashboard#search_by_priority', as: 'search'
  get 'comparison', to: 'dashboard#city_comparison', as: 'comparison'
  get 'search/cities/:id', to: 'cities#show', as: 'search_city'

  post '/cities/add/:id', to: 'favorite_cities#add', as: 'add_city'
  delete '/cities/add/:id', to: 'favorite_cities#remove', as: 'remove_city'

  get '/cities/comparison_result', to: 'dashboard#comparison_result', as: 'comparison_result'

  resources :cities, only: [:show]

  resources :cities do
    resources :reviews, only: [:new, :create, :index, :show]
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
