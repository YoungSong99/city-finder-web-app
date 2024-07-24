class DashboardController < ApplicationController
  def index
    @q = City.includes(:crime_rates, :school_grades, :appreciation_values).ransack(params[:q])
    @cities = @q.result(distinct: true)

    if params[:order].present?
      valid_sort_columns = [
        'crime_rates.crime_index',
        'crime_rates.violent_crime_rate',
        'crime_rates.property_crime_rate',
        'school_grades.score_compared_to_il',
        'school_grades.score_compared_to_us',
        'appreciation_values.latest_quarter',
        'appreciation_values.last_12months',
        'appreciation_values.last_2years',
        'appreciation_values.last_5years',
        'appreciation_values.since_2000'
      ]
      order_params = params[:order].select { |param| valid_sort_columns.include?(param) }
      order_clause = order_params.map { |param| "#{param} DESC" }.join(', ')

      @cities = @cities.joins(:crime_rates, :school_grades, :appreciation_values)
                       .group('cities.id, cities.city_name, cities.state, cities.longitude, cities.latitude, cities.created_at, cities.updated_at,
                               crime_rates.id, crime_rates.city_id, crime_rates.crime_index, crime_rates.violent_crime_rate, crime_rates.property_crime_rate, crime_rates.created_at, crime_rates.updated_at,
                               school_grades.id, school_grades.city_id, school_grades.score_compared_to_us, school_grades.score_compared_to_il, school_grades.created_at, school_grades.updated_at,
                               appreciation_values.id, appreciation_values.latest_quarter, appreciation_values.last_12months, appreciation_values.last_2years, appreciation_values.last_5years, appreciation_values.last_10years, appreciation_values.since_2000, appreciation_values.city_id, appreciation_values.created_at, appreciation_values.updated_at')
                       .having('COUNT(crime_rates.id) > 0 AND COUNT(school_grades.id) > 0 AND COUNT(appreciation_values.id) > 0')
                       .order(order_clause)
    end
  end
end
