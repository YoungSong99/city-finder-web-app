class FavoriteCitiesController < ApplicationController
  before_action :authenticate_user!

  def add
    city_id = params[:id].to_i
    @the_city = City.find(city_id)
    unless current_user.favorite_cities.exists?(city_id: city_id)
      current_user.favorite_cities.create(city_id: city_id)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def remove
    city_id = params[:id].to_i
    @the_city = City.find(city_id)
    favorite_city = current_user.favorite_cities.find_by(city_id: city_id)
    favorite_city.destroy if favorite_city

    respond_to do |format|
      format.html
      format.js
    end
  end
end
