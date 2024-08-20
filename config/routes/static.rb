get 'about', to: 'static#about', as: 'about'
get 'contact', to: 'contacts#new', as: 'contact'
post 'contact', to: 'contacts#create'
get 'city-map', to: 'static#map', as: 'city_map'