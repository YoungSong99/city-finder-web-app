module City::Rankable
  extend ActiveSupport::Concern

  class_methods do
    def filter_by_priorities(city_ids, priorities)
      cities = City.where(id: city_ids)
                   .joins(:crime_rates, :school_grades, :appreciation_values, :prices)

      if priorities.any?(&:present?)
        order_clause = build_order_clause(priorities)
        cities = cities.order(order_clause)
      end

      cities
    end

    def build_order_clause(priorities)
      priority_mapping = {
        'School' => 'school_grades.score_compared_to_il DESC',
        'Safety' => 'crime_rates.crime_index DESC',
        'Appreciation' => 'appreciation_values.last_12months DESC',
        'Sales_low' => 'prices.median_home_value ASC',
        'Sales_high' => 'prices.median_home_value DESC',
        'rent_low' => 'prices.rental_value ASC',
        'rent_high' => 'prices.rental_value DESC'
      }

      valid_priorities = priorities.compact.map { |priority| priority_mapping[priority] }.compact
      order_clause = valid_priorities.join(', ')

      order_clause.presence || 'city_name ASC'
    end
  end
end