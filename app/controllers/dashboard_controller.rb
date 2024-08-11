class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :load_stored_search_results, only: [:priority_result]

  def convenience_filter
    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)

    selected_grocery = params[:grocery] || []
    selected_gym = params[:gym] || []
    selected_languages = params[:community_language] || []
    selected_convenience_option = params[:convenience_option] || []

    @q = City.ransack(params[:q])
    @cities = @q.result.joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    if selected_convenience_option.include?("All")
      @cities = City.joins(:crime_rates, :school_grades, :appreciation_values, :prices)
    end

    if selected_convenience_option.include?("Metra")
      @cities = @cities.joins(:metras).distinct
    end

    if selected_grocery.present?
      @cities = @cities.joins(:groceries).where(groceries: { name: selected_grocery }).distinct
    end

    if selected_gym.present?
      @cities = @cities.joins(:gyms).where(gyms: { name: selected_gym }).distinct
    end

    if selected_languages.present?
      @cities = @cities.joins(:languages).where(languages: { name: selected_languages }).distinct
    end

    city_ids = @cities.pluck(:id)

    session[:filter_results_city_ids] = city_ids

    respond_to do |format|
      format.html
      format.js
    end
  end

  def search_by_priority
    city_ids = session[:filter_results_city_ids] || []
    Rails.logger.info("Retrieved cached city IDs from search_by_priority: #{city_ids}")

    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)

    @cities = City.where(id: city_ids)
                  .joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    if priorities.any?(&:present?)
      order_clause = build_order_clause(priorities)
      @cities = @cities.order(order_clause)
    end

    @cities = @cities.limit(5)
    session[:priority_search_city_ids] = @cities.pluck(:id)

    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: @cities.map { |city|
          {
            latitude: city.latitude,
            longitude: city.longitude,
            label: city.city_name,
            tooltip: render_to_string(partial: 'tooltip', locals: { city: city }, formats: [:html]),
            url: search_by_name_result_detail_url(city, format: :json)
          }
        }
      end
    end
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

    @saved_cities = City.where(id: current_user.favorite_cities.pluck(:city_id))
    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: @saved_cities.map { |city|
          {
            latitude: city.latitude,
            longitude: city.longitude,
            label: city.city_name,
            tooltip: render_to_string(partial: 'tooltip', locals: { city: city }, formats: [:html]),
            url: search_by_name_result_detail_url(city, format: :json)
          }
        }
      end
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
      'rent_high' => 'prices.rental_value DESC'
    }

    order_clause = priorities.map { |priority| priority_mapping[priority] }.compact.join(', ')
    order_clause.presence || 'city_name ASC'
  end
end
