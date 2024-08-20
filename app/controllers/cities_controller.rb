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

    redirect_to rank_cities_path(city_ids: @city_ids)
  end

  def rank
    @greeting = ["Good Choice", "I like that", "Awesome"].sample

    city_ids = params[:city_ids].map(&:to_i)
    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    @cities = City.filter_by_priorities(city_ids, priorities)
    @city_ids = @cities.pluck(:id)
  end

  def rank_submit
    city_ids = params[:city_ids].split(',').map(&:to_i)
    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    @cities = City.filter_by_priorities(city_ids, priorities).limit(5)
    @city_ids = @cities.pluck(:id)

    redirect_to results_cities_path(city_ids: @city_ids)
  end

  def rank_result
    city_ids = params[:city_ids].map(&:to_i)
    @cities = City.where(id: city_ids)

    respond_to do |format|
      format.html
      format.json
    end
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
