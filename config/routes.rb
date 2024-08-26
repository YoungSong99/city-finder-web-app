Rails.application.routes.draw do
  devise_for :users

  root 'static#home'

  draw(:static)

  resources :cities, only: [:show] do
    collection do
      get 'name', to: 'cities#name', as: 'name'
    end
    resources :reviews
  end

  scope 'compare-cities' do
    get '/', to: 'comparison#index', as: 'compare_cities'
    get '/export', to: 'comparison#export', as: 'export_comparison'
  end

  resources :find, only: [:show, :update]
  resources :favorite_cities, only: [:index, :create, :destroy]
  resources :contacts, only: [:new, :create]
end
