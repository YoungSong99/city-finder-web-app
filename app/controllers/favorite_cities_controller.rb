class FavoriteCitiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :find_city, only: [:create, :destroy]

  def index
    sample_city_names = ['Chicago', 'Mendota', 'Cary', 'Winnetka']
    @saved_cities = user_signed_in? ? current_user.favorite_cities : City.where(city_name: sample_city_names)
  end

  def create
    unless current_user.favorite_cities.exists?(city_id: @the_city.id)
      current_user.favorite_cities.create(city_id: @the_city.id)
    end

    respond_to_format
  end

  def destroy
    favorite_city = current_user.favorite_cities.find_by(city_id: @the_city.id)
    favorite_city&.destroy

    respond_to_format
  end

  private

  def authenticate_user!
    unless user_signed_in?
      flash[:notice] = "Welcome to CityFinder! Log in to save your favorite cities and explore more features.😉".html_safe
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
        format.js { render js: "alert('Welcome to CityFinder!\\nLog in to save your favorite cities and explore more features.😉'); window.location.href = '#{new_user_session_path}';" }
      end
    end
  end

  def find_city
    @the_city = City.find(params[:id])
  end

  def respond_to_format
    respond_to do |format|
      format.html
      format.js
    end
  end
end
