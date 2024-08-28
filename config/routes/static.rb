get 'about', to: 'static#about', as: 'about'
get 'contact', to: 'contacts#new', as: 'contact'
post 'contact', to: 'contacts#create'
get 'city-map', to: 'static#map', as: 'city_map'

get '/404', to: 'errors#not_found'
get '/500', to: 'errors#internal_server_error'

## Comment: This is amazin. Seperating your static routes from your domain logic.
