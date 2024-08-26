module City::Rankable
  extend ActiveSupport::Concern

  class_methods do
    # Filters cities based on provided IDs and a set of priorities for ordering.
    # If priorities are given, cities are sorted accordingly; otherwise, the default ordering is applied.
    def filter_by_priorities(city_ids, priorities)
      cities = City.where(id: city_ids)
                   .joins(:crime_rates, :school_grades, :appreciation_values, :prices)

      if priorities.any?(&:present?)
        order_clause = build_order_clause(priorities) # Builds an SQL order clause based on the given priorities.
        cities = cities.order(order_clause)
      end

      cities
    end

    def build_order_clause(priorities)
      # Constructs an SQL order clause based on the user's selected priorities.
      # The priorities determine how cities are sorted in the resulting dataset.

      priority_mapping = {
        'School' => 'school_grades.score_compared_to_il DESC',
        'Safety' => 'crime_rates.crime_index DESC',
        'Appreciation' => 'appreciation_values.last_12months DESC',
        'Sales_low' => 'prices.median_home_value ASC',
        'Sales_high' => 'prices.median_home_value DESC',
        'rent_low' => 'prices.rental_value ASC',
        'rent_high' => 'prices.rental_value DESC'
      }

      # Map the given priorities to SQL snippets. Discard any priorities that are nil or invalid.
      valid_priorities = priorities.compact.map { |priority| priority_mapping[priority] }.compact
      order_clause = valid_priorities.join(', ')

      # If no valid priorities are provided, default to sorting by city name alphabetically.
      order_clause.presence || 'city_name ASC'
    end
  end
end