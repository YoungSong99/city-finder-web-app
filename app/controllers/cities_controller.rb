class CitiesController < ApplicationController

  def show
    @the_city =  City.find(params[:id])
  end

  def create
    the_city = City.new
    the_city.city_name = params.fetch("query_city_name")
    the_city.state = params.fetch("query_state")
    the_city.longitude = params.fetch("query_longitude")
    the_city.latitude = params.fetch("query_latitude")

    if the_city.valid?
      the_city.save
      redirect_to("/cities", { :notice => "City created successfully." })
    else
      redirect_to("/cities", { :alert => the_city.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_city = City.where({ :id => the_id }).at(0)

    the_city.city_name = params.fetch("query_city_name")
    the_city.state = params.fetch("query_state")
    the_city.longitude = params.fetch("query_longitude")
    the_city.latitude = params.fetch("query_latitude")

    if the_city.valid?
      the_city.save
      redirect_to("/cities/#{the_city.id}", { :notice => "City updated successfully."} )
    else
      redirect_to("/cities/#{the_city.id}", { :alert => the_city.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_city = City.where({ :id => the_id }).at(0)

    the_city.destroy

    redirect_to("/cities", { :notice => "City deleted successfully."} )
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
