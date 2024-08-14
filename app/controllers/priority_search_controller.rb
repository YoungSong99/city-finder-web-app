class PrioritySearchController < ApplicationController

  def priority_rank
    @greeting = ["Good Choice", "I like that", "Awesome"].sample

    city_ids = params[:city_ids].map(&:to_i)
    apply_priorities(city_ids)
    @city_ids = @cities.pluck(:id)
  end

  def priority_rank_submit
    city_ids = params[:city_ids].split(',').map(&:to_i)
    apply_priorities(city_ids)
    @cities = @cities.limit(5)
    @city_ids = @cities.pluck(:id)

    redirect_to city_search_results_path(city_ids: @city_ids)
  end


  def priority_result
    city_ids = params[:city_ids].map(&:to_i)
    @cities = City.where(id: city_ids)

    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def apply_priorities(city_ids)
    @cities = City.where(id: city_ids)
                  .joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    if priorities.any?(&:present?)
      order_clause = build_order_clause(priorities)
      @cities = @cities.order(order_clause)
    end
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
