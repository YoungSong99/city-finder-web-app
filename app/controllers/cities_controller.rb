class CitiesController < ApplicationController

  def show
    @the_city = City.find(params[:id])
  end



  helper_method :display_stars

  private

  def display_stars(city)
    filled_star_icon = '<span class="fa fa-star checked star-icon"></span>'
    half_star_icon = '<span class="fa fa-star-half-alt checked star-icon"></span>'

    full_stars = city.average_rating.floor
    half_star = (city.average_rating - full_stars >= 0.5) ? 1 : 0

    stars = filled_star_icon * full_stars + half_star_icon * half_star
    stars.html_safe
  end

end
