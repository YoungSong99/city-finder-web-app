class CityFilterController < ApplicationController
  def convenience_filter
    load_convenience_filter_data
    filter_cities
    store_city_ids
  end

  def convenience_filter_submit
    load_convenience_filter_data
    filter_cities
    store_city_ids

    redirect_to city_search_path(city_ids: @city_ids)
  end

  private

  def load_convenience_filter_data
    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)
  end

  def filter_cities
    selected_grocery = params[:grocery] || []
    selected_gym = params[:gym] || []
    selected_languages = params[:community_language] || []
    selected_convenience_option = params[:convenience_option] || []

    @q = City.ransack(params[:q])
    @cities = @q.result.joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    if selected_convenience_option.include?("All")
      @cities = City.joins(:crime_rates, :school_grades, :appreciation_values, :prices)
    end

    if selected_convenience_option.include?("Distance")
      apply_distance_filter
    end

    if selected_convenience_option.include?("Metra")
      @cities = @cities.joins(:metras).distinct
    end

    if selected_grocery.present?
      @cities = @cities.joins(:groceries).where(groceries: { name: selected_grocery }).distinct
    end

    if selected_gym.present?
      @cities = @cities.joins(:gyms).where(gyms: { name: selected_gym }).distinct
    end

    if selected_languages.present?
      @cities = @cities.joins(:languages).where(languages: { name: selected_languages }).distinct
    end
  end

  def apply_distance_filter
    user_location = Geocoder.search(params[:place])
    lat, lng = user_location.first.coordinates

    distance_threshold = params[:distance].to_i * 1609.34

    @cities = City
                .select('cities.*, earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) AS distance', lat, lng)
                .where('earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) < ?', lat, lng, distance_threshold)
  end

  def store_city_ids
    @city_ids = @cities.pluck(:id)
  end
end
