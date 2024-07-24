class CrimeRatesController < ApplicationController
  def index
    matching_crime_rates = CrimeRate.all

    @list_of_crime_rates = matching_crime_rates.order({ :created_at => :desc })

    render({ :template => "crime_rates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_crime_rates = CrimeRate.where({ :id => the_id })

    @the_crime_rate = matching_crime_rates.at(0)

    render({ :template => "crime_rates/show" })
  end

  def create
    the_crime_rate = CrimeRate.new
    the_crime_rate.city_id = params.fetch("query_city_id")
    the_crime_rate.crime_rate = params.fetch("query_crime_rate")
    the_crime_rate.violent_crime_rate = params.fetch("query_violent_crime_rate")
    the_crime_rate.property_crime_rate = params.fetch("query_property_crime_rate")

    if the_crime_rate.valid?
      the_crime_rate.save
      redirect_to("/crime_rates", { :notice => "Crime rate created successfully." })
    else
      redirect_to("/crime_rates", { :alert => the_crime_rate.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_crime_rate = CrimeRate.where({ :id => the_id }).at(0)

    the_crime_rate.city_id = params.fetch("query_city_id")
    the_crime_rate.crime_rate = params.fetch("query_crime_rate")
    the_crime_rate.violent_crime_rate = params.fetch("query_violent_crime_rate")
    the_crime_rate.property_crime_rate = params.fetch("query_property_crime_rate")

    if the_crime_rate.valid?
      the_crime_rate.save
      redirect_to("/crime_rates/#{the_crime_rate.id}", { :notice => "Crime rate updated successfully."} )
    else
      redirect_to("/crime_rates/#{the_crime_rate.id}", { :alert => the_crime_rate.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_crime_rate = CrimeRate.where({ :id => the_id }).at(0)

    the_crime_rate.destroy

    redirect_to("/crime_rates", { :notice => "Crime rate deleted successfully."} )
  end
end
