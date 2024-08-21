class ComparisonController < ApplicationController
  before_action :authenticate_user!, only: [:export]

  def index
    sample_city_names = ['Chicago', 'Mendota', 'Cary', 'Winnetka']
    @cities = user_signed_in? ? current_user.cities : City.where(city_name: sample_city_names)

    @city_totals = @cities.map do |city|
      {
        name: city.city_name,
        data: city.scores
      }
    end
  end

  def export
    @favorite_cities = current_user.favorite_cities.includes(:city => [:crime_rates, :school_grades, :appreciation_values, :prices, :metras, :grocery_cities, :gym_cities])

    respond_to do |format|
      format.csv do
        send_data City.to_csv(@favorite_cities), filename: "city-finder-#{Date.today}.csv"
      end
    end
  end
end
