class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :load_stored_search_results, only: [:priority_result]


  def search_by_priority
    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    @q = City.ransack(params[:q])
    @cities = @q.result.joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)

    if priorities.any?
      order_clause = build_order_clause(priorities)
      @cities = @cities.joins(:crime_rates, :school_grades, :appreciation_values, :prices)
                       .order(order_clause)
    end

    @cities = @cities.limit(5)
    cache_key = "search_results_#{current_user.id}_#{Time.now.to_i}"
    Rails.cache.write(cache_key, @cities.pluck(:id), expires_in: 1.hours)

    @cities.each do |city|
      puts city.city_name
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def priority_result
    @cities = @stored_search_results
  end

  def search_by_name
    if params[:q].present?
      @q = City.ransack(params[:q])
      @the_city = @q.result(distinct: true)
      puts @the_city
    else
      @q = City.ransack(params[:q])
      @the_city = City.none
    end
  end

  def search_by_name_result
    if user_signed_in?
      @saved_cities = City.where(id: current_user.favorite_cities.pluck(:city_id))
    else
      redirect_to new_user_session_path, alert: 'This service requires login.'
    end
  end


  private

  def load_stored_search_results
    if session[:search_results_cache_key].present?
      city_ids = Rails.cache.read(session[:search_results_cache_key])
      @stored_search_results = City.where(id: city_ids)
    else
      @stored_search_results = City.none
    end
  end


  def build_order_clause(priorities)
    priority_mapping = {
      'School' => 'school_grades.score_compared_to_us DESC',
      'Safety' => 'crime_rates.crime_index DESC',
      'Appreciation' => 'appreciation_values.last_12months DESC',
      'Sales_low' => 'prices.median_home_value ASC',
      'Sales_high' => 'prices.median_home_value DESC',
      'rent_low' => 'prices.rental_value ASC',
      'rent_high' => 'prices.rental_value DESC',
    }

    order_clause = priorities.map { |priority| priority_mapping[priority] }.compact.join(', ')
    order_clause.presence || 'city_name ASC'
  end

end
