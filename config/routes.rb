Rails.application.routes.draw do
  devise_for :users

  root 'static#home'
  draw(:static)
  
  resources :cities, only: [:show] do
    collection do
      get 'filter', to: 'cities#filter', as: 'filter'
      post 'filter', to: 'cities#filter_submit', as: 'filter_submit'
      get 'rank', to: 'cities#rank', as: 'rank'
      post 'rank', to: 'cities#rank_submit', as: 'rank_submit'
      get 'results', to: 'cities#rank_result', as: 'results'
      get 'search', to: 'cities#search', as: 'search'
    end
    resources :reviews, only: [:index, :create, :update, :destroy, :new, :edit]
  end

  get 'compare-cities', to: 'comparison#index', as: 'compare_cities'
  get 'compare-cities/export', to: 'comparison#export', as: 'export_comparison'

  resources :favorite_cities, only: [:index, :create, :destroy]
  resources :contacts, only: [:new, :create]
end
