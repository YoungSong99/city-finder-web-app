class FavoriteCitiesController < ApplicationController
  def add
    unless user_signed_in?
      respond_to do |format|
        format.html { redirect_to new_user_session_path, alert: "Welcome to CityFinder!<br>Log in to save your favorite cities and explore more features.😉".html_safe }
        format.js { render js: "alert('Welcome to CityFinder!\\nLog in to save your favorite cities and explore more features.😉'); window.location.href = '#{new_user_session_path}';" }
      end
      return
    end

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
