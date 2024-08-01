class DashboardController < ApplicationController
  def index
    @q = City.ransack(params[:q])
    @cities = @q.result.includes(:crime_rates, :school_grades, :appreciation_values)
    @cities = @cities.page(params[:page]).per(10)
  end

  def comparison_search
    if params[:q].present?
      @q = City.ransack(params[:q])
      @the_city = @q.result(distinct: true)
      puts @the_city
    else
      @q = City.ransack(params[:q])
      @the_city = City.none
    end
  end

  def comparison_result

  end

  def search
    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    @q = City.ransack(params[:q])
    @cities = @q.result.includes(:crime_rates, :school_grades, :appreciation_values)

    if priorities.any?
      order_clause = build_order_clause(priorities)
      @cities = @cities.joins(:crime_rates, :school_grades, :appreciation_values)
                       .order(order_clause)
    end

    @cities = @cities.limit(5)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def build_order_clause(priorities)
    priority_mapping = {
      'School' => 'school_grades.score_compared_to_us DESC',
      'Safety' => 'crime_rates.crime_index DESC',
      'Appreciation' => 'appreciation_values.last_12months DESC',
      # 'Metra' => 'metra_stations_count DESC',
      # 'Grocery' => 'grocery_stores_count DESC',
      # 'Coffee' => 'coffee_shops_count DESC',
      # 'Community' => 'community_score DESC'
    }

    order_clause = priorities.map { |priority| priority_mapping[priority] }.compact.join(', ')
    order_clause.presence || 'city_name ASC'
  end
end
