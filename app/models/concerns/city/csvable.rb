require 'csv'

module City::Csvable
  extend ActiveSupport::Concern

  class_methods do
    def to_csv(favorite_cities)
      headers = [
        'City Name', 'Crime Index', 'Property Crime', 'Violent Crime',
        'IL School Score', 'US School Score', 'Quarter Appreciation',
        '1 Year Appreciation', '2 Years Appreciation', '5 Years Appreciation',
        '10 Years Appreciation', 'Since 2000 Appreciation', 'Median Home Value',
        'Rental Value', 'Metra', 'Grocery', 'Gym'
      ]

      CSV.generate(headers: true) do |csv|
        csv << headers
        favorite_cities.each do |favorite_city|
          city = favorite_city.city
          row = []
          row << city.city_name

          if city.crime_rates.any?
            row << city.crime_rates.first.crime_index
            row << city.crime_rates.first.property_crime_rate
            row << city.crime_rates.first.violent_crime_rate
          else
            row.concat(['-', '-', '-'])
          end

          if city.school_grades.any?
            row << city.school_grades.first.score_compared_to_il
            row << city.school_grades.first.score_compared_to_us
          else
            row.concat(['-', '-'])
          end

          if city.appreciation_values.any?
            row << city.appreciation_values.first.latest_quarter
            row << city.appreciation_values.first.last_12months
            row << city.appreciation_values.first.last_2years
            row << city.appreciation_values.first.last_5years
            row << city.appreciation_values.first.last_10years
            row << city.appreciation_values.first.since_2000
          else
            row.concat(['-', '-', '-', '-', '-', '-'])
          end

          if city.prices.any?
            row << city.prices.first.median_home_value
            row << city.prices.first.rental_value
          else
            row.concat(['-', '-'])
          end

          row << (city.metras.any? ? 'Y' : 'N')

          row << city.grocery_cities.count
          row << city.gym_cities.count

          csv << row
        end
      end
    end
  end
end