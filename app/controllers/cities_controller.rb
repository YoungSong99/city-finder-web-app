class CitiesController < ApplicationController

  def show
    @the_city = City.find(params[:id])
  end

  def filter
    load_convenience_filter_data
    @cities = City.filter_cities(params)
    store_city_ids
  end

  def filter_submit
    load_convenience_filter_data
    @cities = City.filter_cities(params)
    store_city_ids

    redirect_to city_search_path(city_ids: @city_ids)
  end



  helper_method :display_stars

  private

  def load_convenience_filter_data
    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)
  end

  def store_city_ids
    @city_ids = @cities.pluck(:id)
  end

  def display_stars(city)
    filled_star_icon = '<span class="fa fa-star checked star-icon"></span>'
    half_star_icon = '<span class="fa fa-star-half-alt checked star-icon"></span>'

    full_stars = city.average_rating.floor
    half_star = (city.average_rating - full_stars >= 0.5) ? 1 : 0

    stars = filled_star_icon * full_stars + half_star_icon * half_star
    stars.html_safe
  end

end
