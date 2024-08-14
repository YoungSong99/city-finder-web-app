class CityNameSearchController < ApplicationController
  def search_by_name
    @q = City.ransack(params[:q])
    @the_city = @q.result(distinct: true) if params[:q].present?

    load_saved_cities
    Rails.logger.debug("Received city_ids: #{@saved_cities.inspect}")

    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end


  private

  def load_saved_cities
    if user_signed_in?
      @saved_cities = City.where(id: current_user.favorite_cities.pluck(:city_id))
    else
      @saved_cities = City.where(city_name: 'Chicago')
    end
  end
end
