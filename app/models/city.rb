# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  city_name  :string
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cities_on_latitude   (latitude)
#  index_cities_on_longitude  (longitude)
#

require 'csv'

class City < ApplicationRecord
  has_many :crime_rates, class_name: "CrimeRate", foreign_key: "city_id", dependent: :destroy
  has_many :reviews, class_name: "Review", foreign_key: "city_id", dependent: :destroy
  has_many :appreciation_values, class_name: "AppreciationValue", foreign_key: "city_id", dependent: :destroy
  has_many :school_grades, class_name: "SchoolGrade", foreign_key: "city_id", dependent: :destroy
  has_many  :prices, class_name: "Price", foreign_key: "city_id", dependent: :destroy
  has_many  :metras, class_name: "Metra", foreign_key: "city_id", dependent: :destroy
  has_many  :grocery_cities, class_name: "GroceryCity", foreign_key: "city_id", dependent: :destroy
  has_many  :gym_cities, class_name: "GymCity", foreign_key: "city_id", dependent: :destroy
  has_many  :language_cities, class_name: "LanguageCity", foreign_key: "city_id", dependent: :destroy
  has_many  :favorite_cities, class_name: "FavoriteCity", foreign_key: "city_id", dependent: :destroy

  has_many :languages, through: :language_cities
  has_many :users, through: :favorite_cities
  has_many :gyms, through: :gym_cities
  has_many :groceries, through: :grocery_cities

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    [city_name, 'IL', 'USA'].compact.join(', ')
  end

  def average_rating
    unless self.reviews.any?
      0
    end
    reviews.average(:ratings).to_f.round(2)
  end

  def reviews_count
    unless self.reviews.any?
      0
    end
    reviews.count
  end

  def self.filter_cities(params)
    cities = City.joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    if params[:convenience_option]&.include?("All")
      cities = City.joins(:crime_rates, :school_grades, :appreciation_values, :prices)
    end

    if params[:convenience_option]&.include?("Distance")
      cities = apply_distance_filter(cities, params)
    end

    if params[:convenience_option]&.include?("Metra")
      cities = cities.joins(:metras).distinct
    end

    if params[:grocery].present?
      cities = cities.joins(:groceries).where(groceries: { name: params[:grocery] }).distinct
    end

    if params[:gym].present?
      cities = cities.joins(:gyms).where(gyms: { name: params[:gym] }).distinct
    end

    if params[:community_language].present?
      cities = cities.joins(:languages).where(languages: { name: params[:community_language] }).distinct
    end

    cities
  end

  def self.apply_distance_filter(cities, params)
    address = params[:address].strip if params[:address].present?
    city_name = params[:city_name].strip if params[:city_name].present?
    state = "IL"

    full_address = [address, city_name, state].compact.join(", ")
    user_location = Geocoder.search(full_address)

    return cities if user_location.blank?

    lat, lng = user_location.first.coordinates
    distance_threshold = params[:distance].to_i * 1609.34

    cities
      .select('cities.*, earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) AS distance', lat, lng)
      .where('earth_distance(ll_to_earth(?, ?), ll_to_earth(cities.latitude, cities.longitude)) < ?', lat, lng, distance_threshold)
  end

  def self.filter_by_priorities(city_ids, priorities)
    cities = City.where(id: city_ids)
                 .joins(:crime_rates, :school_grades, :appreciation_values, :prices)

    if priorities.any?(&:present?)
      order_clause = build_order_clause(priorities)
      cities = cities.order(order_clause)
    end

    cities
  end

  def self.build_order_clause(priorities)
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

  # Ransack configuration
  def self.ransackable_associations(auth_object = nil)
    %w(appreciation_values crime_rates school_grades language_cities gym_cities prices metras grocery_cities)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(city_name latitude longitude state)
  end

  # Export CSV configuration
  def self.to_csv(favorite_cities)
    headers = [
      'City Name', 'Crime Index', 'Property Crime', 'Violent Crime',
      'IL School Score', 'US School Score', 'Quarter Appreciation',
      '1 Year Appreciation', '2 Years Appreciation', '5 Years Appreciation',
      '10 Years Appreciation', 'Since 2000 Appreciation', 'Median Home Value',
      'Rental Value', 'Metra', 'Grocery', 'Gym'
    ]

    CSV.generate(headers: true) do |csv|
      csv << headers
      favorite_cities.each do |favorite_city|
        city = favorite_city.city
        row = []
        row << city.city_name

        if city.crime_rates.any?
          row << city.crime_rates.first.crime_index
          row << city.crime_rates.first.property_crime_rate
          row << city.crime_rates.first.violent_crime_rate
        else
          row.concat(['-', '-', '-'])
        end

        if city.school_grades.any?
          row << city.school_grades.first.score_compared_to_il
          row << city.school_grades.first.score_compared_to_us
        else
          row.concat(['-', '-'])
        end

        if city.appreciation_values.any?
          row << city.appreciation_values.first.latest_quarter
          row << city.appreciation_values.first.last_12months
          row << city.appreciation_values.first.last_2years
          row << city.appreciation_values.first.last_5years
          row << city.appreciation_values.first.last_10years
          row << city.appreciation_values.first.since_2000
        else
          row.concat(['-', '-', '-', '-', '-', '-'])
        end

        if city.prices.any?
          row << city.prices.first.median_home_value
          row << city.prices.first.rental_value
        else
          row.concat(['-', '-'])
        end

        row << (city.metras.any? ? 'Y' : 'N')

        row << city.grocery_cities.count
        row << city.gym_cities.count

        csv << row
      end
    end
  end

  private

  def address_changed?
    city_name_changed? || state_changed?
  end
end
