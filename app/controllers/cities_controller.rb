class CitiesController < ApplicationController
  def index
    matching_cities = City.all

    @list_of_cities = matching_cities.order({ :created_at => :desc })

    render({ :template => "cities/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_cities = City.where({ :id => the_id })

    @the_city = matching_cities.at(0)

    render({ :template => "cities/show" })
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
end
