module City::Filterable
  extend ActiveSupport::Concern

  class_methods do
    def filter_cities(params)
      cities = City.joins(:crime_rates, :school_grades, :appreciation_values, :prices)

      if params[:convenience_option]&.include?("All")
        cities = City.joins(:crime_rates, :school_grades, :appreciation_values, :prices)
      end

      if params[:convenience_option]&.include?("Distance")
        cities = apply_distance_filter(cities, params)
      end

      if params[:convenience_option]&.include?("Metra")
        cities = cities.joins(:metras).distinct
      end

      if params[:grocery].present?
        cities = cities.joins(:groceries).where(groceries: { name: params[:grocery] }).distinct
      end

      if params[:gym].present?
        cities = cities.joins(:gyms).where(gyms: { name: params[:gym] }).distinct
      end

      if params[:community_language].present?
        cities = cities.joins(:languages).where(languages: { name: params[:community_language] }).distinct
      end

      cities
    end

    def apply_distance_filter(cities, params)
      address = params[:address].strip if params[:address].present?
      city_name = params[:city_name].strip if params[:city_name].present?
      state = "IL"

      full_address = [address, city_name, state].compact.join(", ")
      user_location = Geocoder.search(full_address)

      return cities if user_location.blank?

      lat, lng = user_location.first.coordinates
      distance_threshold = params[:distance].to_i * 1609.34

      cities
        .select('cities.*, earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) AS distance', lat, lng)
        .where('earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) < ?', lat, lng, distance_threshold)
    end
  end
end
