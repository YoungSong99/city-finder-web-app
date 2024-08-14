Rails.application.routes.draw do
  devise_for :users

  # static pages
  root 'static#home'
  get 'about', to: 'static#about', as: 'about'
  get 'contact', to: 'static#contact', as: 'contact'
  get 'city-map', to: 'static#map', as: 'city_map'

  # City filter
  get 'find-city', to: 'city_filter#convenience_filter', as: 'find_city'
  post 'find-city', to: 'city_filter#convenience_filter_submit', as: 'submit_city_filter'

  # Priority Search
  get 'city-search', to: 'city_priority_search#priority_rank', as: 'city_search'
  post 'city-search', to: 'city_priority_search#priority_rank_submit', as: 'submit_city_search'
  get 'city-search/results', to: 'city_priority_search#priority_result', as: 'city_search_results'

  # Search by Name
  get 'search-by-name', to: 'city_name_search#search_by_name', as: 'search_by_name'

  # Saved City
  get 'saved-cities', to: 'favorite_cities#list', as: 'saved_cities'
  post 'saved-cities/:id', to: 'favorite_cities#add', as: 'add_favorite_city'
  delete 'saved-cities/:id', to: 'favorite_cities#remove', as: 'remove_favorite_city'

  # Compare City
  get 'compare-cities', to: 'comparison#index', as: 'compare_cities'
  get 'compare-cities/export', to: 'comparison#export', as: 'export_comparison'

  # City Detail
  get 'city/:id', to: 'cities#show', as: 'city_detail'

  # Reviews
  resources :cities do
    resources :reviews, only: [:index, :create, :update, :destroy, :new]
  end
end
