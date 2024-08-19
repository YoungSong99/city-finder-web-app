class CityFilterController < ApplicationController
  def convenience_filter
    load_convenience_filter_data
    @cities = City.filter_cities(params)
    store_city_ids
  end

  def convenience_filter_submit
    load_convenience_filter_data
    @cities = City.filter_cities(params)
    store_city_ids

    redirect_to city_search_path(city_ids: @city_ids)
  end

  private

  def load_convenience_filter_data
    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)
  end

  def store_city_ids
    @city_ids = @cities.pluck(:id)
  end
end
