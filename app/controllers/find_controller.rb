class FindController < ApplicationController
  # This controller handles a multi-step process for finding cities based on user preferences.
  include Wicked::Wizard
  steps :filter, :rank, :result

  # Render the current step of the wizard.
  def show
    case step
    when :filter
      # filters (e.g., groceries, languages, gyms) refer to filterable concern in city model
      # and retrieve cities that match the filter criteria from the params.
      load_convenience_filter_data
      @cities = City.filter_cities(params)
      store_city_ids
    when :rank
      # Retrieve city IDs from params and get the priorities set by the user  refer to rankable concern in city model
      @greeting = ["Good Choice", "I like that", "Awesome"].sample
      city_ids = params[:city_ids] || []
      priorities = params.values_at('priority-0', 'priority-1', 'priority-2')
      @cities = City.filter_by_priorities(city_ids, priorities)
      @city_ids = @cities.pluck(:id)
    when :result
      # retrieve and display the cities that were selected based on their IDs.
      city_ids = params[:city_ids] || []
      @cities = City.where(id: city_ids)
    end

    render_wizard
  end

  # The 'update' action handles form submissions at each step of the wizard.
  def update
    case step
    when :filter
      load_convenience_filter_data
      @cities = City.filter_cities(params)
      store_city_ids
    when :rank
      city_ids = params[:city_ids].split(',').map(&:to_i)
      priorities = params.values_at('priority-0', 'priority-1', 'priority-2')
      # Limit the number of cities shown to 5 and store their IDs.
      @cities = City.filter_by_priorities(city_ids, priorities).limit(5)
      @city_ids = @cities.pluck(:id)
    end

    # Redirect to the next step in the wizard, passing the selected city IDs.
    redirect_to next_wizard_path(city_ids: @city_ids)
  end

  private

  def load_convenience_filter_data
    @grocery_names = Grocery.pluck(:name)
    @language_names = Language.pluck(:name)
    @gym_names = Gym.pluck(:name)
  end

  def store_city_ids
    @city_ids = @cities.pluck(:id)
  end

end
