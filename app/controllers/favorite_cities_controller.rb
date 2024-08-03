class FavoriteCitiesController < ApplicationController
  before_action :authenticate_user!

  def add
    city_id = params[:id].to_i
    unless current_user.favorite_cities.exists?(city_id: city_id)
      current_user.favorite_cities.create(city_id: city_id)
    end
    redirect_to comparison_path, notice: 'City saved successfully.'
  end

  def remove
    city_id = params[:id].to_i
    favorite_city = current_user.favorite_cities.find_by(city_id: city_id)
    favorite_city.destroy if favorite_city
    redirect_to comparison_path, notice: 'City removed successfully.'
  end
end
