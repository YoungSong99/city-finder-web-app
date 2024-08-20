Rails.application.routes.draw do
  devise_for :users

  # static pages
  root 'static#home'
  get 'about', to: 'static#about', as: 'about'
  get 'contact', to: 'contacts#new', as: 'contact'
  post 'contact', to: 'contacts#create'
  get 'city-map', to: 'static#map', as: 'city_map'

  # Search by Name
  get 'search-by-name', to: 'city_name_search#search_by_name', as: 'search_by_name'

  # Compare City
  get 'compare-cities', to: 'comparison#index', as: 'compare_cities'
  get 'compare-cities/export', to: 'comparison#export', as: 'export_comparison'

  # City Detail
  get 'city/:id', to: 'cities#show', as: 'city_detail'

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
  resources :favorite_cities, only: [:index, :create, :destroy]
  resources :contacts, only: [:new, :create]

end
