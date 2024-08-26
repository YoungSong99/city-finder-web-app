class CitiesController < ApplicationController

  def show
    @the_city = City.find(params[:id])
  end

  def name
    @q = City.ransack(params[:q])
    @the_city = @q.result(distinct: true) if params[:q].present?
    load_saved_cities
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  helper_method :display_stars

  private

  def load_saved_cities
    if user_signed_in?
      @saved_cities = City.where(id: current_user.favorite_cities.pluck(:city_id))
    else
      @saved_cities = City.where(city_name: 'Chicago')
    end
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
