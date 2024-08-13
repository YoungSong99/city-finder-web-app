class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:search_by_name_result]
  before_action :load_stored_search_results, only: [:search_by_priority]

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

    if selected_convenience_option.include?("Distance")
      user_location = Geocoder.search(params[:place])
      lat, lng = user_location.first.coordinates

      # Convert miles to meters
      distance_threshold = params[:distance].to_i * 1609.34

      @cities = City
                  .select('cities.*, earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) AS distance', lat, lng)
                  .where('earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) < ?', lat, lng, distance_threshold)
    end

    if selected_convenience_option.include?("Metra")
      @cities = @cities.joins(:metras).distinct
    end

    if selected_grocery.present?
      @cities = @cities.joins(:groceries).where(groceries: { name: selected_grocery }).distinct
    end

    if selected_gym.present?
      @cities = @cities.joins(:gyms).where(gyms: { name: selected_gym }).distinct
      puts "triggered #{selected_gym}"
    end

    if selected_languages.present?
      @cities = @cities.joins(:languages).where(languages: { name: selected_languages }).distinct
    end

    @city_ids = @cities.pluck(:id)
    Rails.logger.debug("sending_from_filter_cotroller: #{@city_ids.inspect}")
  end

  def convenience_filter_submit
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

    if selected_convenience_option.include?("Distance")
      user_location = Geocoder.search(params[:place])
      lat, lng = user_location.first.coordinates

      # Convert miles to meters
      distance_threshold = params[:distance].to_i * 1609.34

      @cities = City
                  .select('cities.*, earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) AS distance', lat, lng)
                  .where('earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) < ?', lat, lng, distance_threshold)
    end

    if selected_convenience_option.include?("Metra")
      @cities = @cities.joins(:metras).distinct
    end

    if selected_grocery.present?
      @cities = @cities.joins(:groceries).where(groceries: { name: selected_grocery }).distinct
    end

    if selected_gym.present?
      @cities = @cities.joins(:gyms).where(gyms: { name: selected_gym }).distinct
      puts "triggered #{selected_gym}"
    end

    if selected_languages.present?
      @cities = @cities.joins(:languages).where(languages: { name: selected_languages }).distinct
    end

    @city_ids = @cities.pluck(:id)
    Rails.logger.debug("sending_from_filter_cotroller: #{@city_ids.inspect}")

    redirect_to search_path(city_ids: @city_ids)
  end

  def search_by_priority
    city_ids = params[:city_ids].map(&:to_i)
    Rails.logger.debug("Received city_ids: #{city_ids.inspect}")
    @greeting = ["Good Choice", "I like that", "Awesome"].sample
    @cities = City.where(id: city_ids)
                  .joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')

    if priorities.any?(&:present?)
      order_clause = build_order_clause(priorities)
      @cities = @cities.order(order_clause)
    end

    @city_ids = @cities.pluck(:id)
  end

  def search_by_priority_submit
    city_ids = params[:city_ids].split(',').map(&:to_i)
    Rails.logger.debug("Received city_ids: #{city_ids.inspect}")

    @cities = City.where(id: city_ids)
                  .joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    priorities = params.values_at('priority-0', 'priority-1', 'priority-2')
    Rails.logger.debug("Priorities received: #{priorities.inspect}")


    if priorities.any?(&:present?)
      order_clause = build_order_clause(priorities)
      Rails.logger.debug("Generated order clause: #{order_clause}")
      @cities = @cities.order(order_clause)
    end

    @cities = @cities.limit(5)
    @city_ids = @cities.pluck(:id)
    Rails.logger.debug("sending_priority_controller: #{@city_ids.inspect}")

    redirect_to priority_result_path(city_ids: @city_ids)
  end

  def priority_result
    city_ids = params[:city_ids].map(&:to_i)
    Rails.logger.debug("sending_priority_controller: #{city_ids.inspect}")

    @cities = City.where(id: city_ids)

    respond_to do |format|
      format.html
      format.json
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

    if user_signed_in?
      @saved_cities = City.where(id: current_user.favorite_cities.pluck(:city_id))
    else
      @saved_cities = City.where(city_name: 'Chicago')
    end

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

    Rails.logger.debug("Final order clause: #{order_clause}")
    order_clause.presence || 'city_name ASC'
  end
end
