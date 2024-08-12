Rails.application.routes.draw do
  devise_for :users

  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'
  get 'test', to: 'static#test'

  get 'filter', to: 'dashboard#convenience_filter', as: 'filter'
  get 'search', to: 'dashboard#search_by_priority', as: 'search'
  get 'search/cities', to: 'dashboard#priority_result', as: 'priority_result'
  get 'search/cities/:id', to: 'cities#show', as: 'priority_result_detail'

  get 'search-by-name', to: 'dashboard#search_by_name', as: 'search_by_name'
  get 'saved-cities', to: 'dashboard#search_by_name_result', as: 'saved_cities'
  get 'search-by-name/cities/:id', to: 'cities#show', as: 'search_by_name_result_detail'

  post '/cities/add/:id', to: 'favorite_cities#add', as: 'add_city'
  delete '/cities/add/:id', to: 'favorite_cities#remove', as: 'remove_city'

  get 'comparison', to: 'comparison#index', as: 'comparison'
  get 'comparison/export', to: 'comparison#export', as: 'export_comparison'

  resources :cities, only: [:show]

  resources :cities do
    resources :reviews
  end
end
