class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:comparison_search, :add, :comparison_result]

  def index
    @q = City.ransack(params[:q])
    @cities = @q.result.includes(:crime_rates, :school_grades, :appreciation_values, :prices, :metras, :grocery_cities, :gym_cities, :language_cities)
    @cities = @cities.page(params[:page]).per(100)
  end


  def add
    city_id = params[:id].to_i
    if user_signed_in?
      current_user.saved_cities << city_id unless current_user.saved_cities.include?(city_id)
      current_user.save
      redirect_to search_city_path(city_id), notice: 'City saved successfully.'
    else
      redirect_to new_user_session_path, alert: 'This service requires login.'
    end
  end

  def remove
    city_id = params[:id].to_i
    if user_signed_in?
      if current_user.saved_cities.delete(city_id)
        puts "City #{city_id} removed from user's saved cities."
      else
        puts "Failed to remove city #{city_id}."
      end
      current_user.save
      redirect_to comparison_path, notice: 'City removed successfully.'
    else
      redirect_to new_user_session_path, alert: 'This service requires login.'
    end
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
    @saved_cities = City.where(id: current_user.saved_cities)
  end

  def comparison_result
    if user_signed_in?
      @saved_cities = City.where(id: current_user.saved_cities)
    else
      redirect_to new_user_session_path, alert: 'This service requires login.'
    end
  end

  def search
    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    @q = City.ransack(params[:q])
    @cities = @q.result.includes(:crime_rates, :school_grades, :appreciation_values, :prices)

    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)

    if priorities.any?
      order_clause = build_order_clause(priorities)
      @cities = @cities.joins(:crime_rates, :school_grades, :appreciation_values, :prices)
                       .order(order_clause)
    end

    @cities = @cities.limit(5)

    @cities.each do |city|
      puts city.city_name
    end

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
      'Sales_low' => 'prices.median_home_value ASC',
      'Sales_high' => 'prices.median_home_value DESC',
      'rent_low' => 'prices.rental_value ASC',
      'rent_high' => 'prices.rental_value DESC',
    }

    order_clause = priorities.map { |priority| priority_mapping[priority] }.compact.join(', ')
    order_clause.presence || 'city_name ASC'
  end
end
