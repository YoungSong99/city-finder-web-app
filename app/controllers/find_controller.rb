class FindController < ApplicationController
  # Could be a good place for a comment
  include Wicked::Wizard
  steps :filter, :rank, :result

  def show
    case step
    when :filter
      load_convenience_filter_data
      @cities = City.filter_cities(params)
      store_city_ids
    when :rank
      @greeting = ["Good Choice", "I like that", "Awesome"].sample
      city_ids = params[:city_ids] || []
      priorities = params.values_at('priority-0', 'priority-1', 'priority-2')
      @cities = City.filter_by_priorities(city_ids, priorities)
      @city_ids = @cities.pluck(:id)
    when :result
      city_ids = params[:city_ids] || []
      @cities = City.where(id: city_ids)
    end

    render_wizard
  end

  def update
    case step
    when :filter
      load_convenience_filter_data
      @cities = City.filter_cities(params)
      store_city_ids
    when :rank
      city_ids = params[:city_ids].split(',').map(&:to_i)
      priorities = params.values_at('priority-0', 'priority-1', 'priority-2')
      @cities = City.filter_by_priorities(city_ids, priorities).limit(5)
      @city_ids = @cities.pluck(:id)
    end

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
