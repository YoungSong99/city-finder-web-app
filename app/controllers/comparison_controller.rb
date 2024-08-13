class ComparisonController < ApplicationController
  before_action :authenticate_user!, only: [:export]

  def index
    sample_city_names = ['Chicago', 'Mendota', 'Cary', 'Winnetka']
    @cities = user_signed_in? ? current_user.favorite_cities : City.where(city_name: sample_city_names)

    @city_totals = @cities.map do |city|
      {
        name: city.city_name,
        data: {
          "Safety" => safety_total(city),
          "School" => school_total(city),
          "Convenience" => convenience_total(city),
          "Appreciation" => appreciation_total(city),
          "Price" => price_total(city)
        }
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

  private

  def safety_total(city)
    crime_rate = city.crime_rates.first
    crime_rate ? crime_rate.crime_index.to_i : 0
  end

  def school_total(city)
    school_grade = city.school_grades.first
    school_grade ? school_grade.score_compared_to_il.to_i * 10 : 0
  end

  def convenience_total(city)
    gym_count = city.respond_to?(:gyms) ? city.gyms.count : 0
    grocery_count = city.respond_to?(:groceries) ? city.groceries.count : 0
    convenience_score = gym_count + grocery_count
    max_convenience_value = 27 # Max value for convenience score
    (convenience_score.to_f / max_convenience_value * 100).to_i
  end

  def appreciation_total(city)
    appreciation_value = city.appreciation_values.first
    max_appreciation_value = 34.77 # Max appreciation value
    appreciation_value ? ((appreciation_value.last_12months.to_f / max_appreciation_value) * 100).to_i : 0
  end

  def price_total(city)
    price = city.prices.first
    max_home_value = 1511784.0 # Max home value
    price ? ((price.median_home_value.to_f / max_home_value) * 100).to_i : 0
  end
end
