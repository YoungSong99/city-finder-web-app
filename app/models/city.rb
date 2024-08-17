class City < ApplicationRecord
  include Csvable

  # Associations
  has_many :crime_rates, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :appreciation_values, dependent: :destroy
  has_many :school_grades, dependent: :destroy
  has_many :prices, dependent: :destroy
  has_many :metras, dependent: :destroy
  has_many :grocery_cities, dependent: :destroy
  has_many :gym_cities, dependent: :destroy
  has_many :language_cities, dependent: :destroy
  has_many :favorite_cities, dependent: :destroy

  has_many :languages, through: :language_cities
  has_many :users, through: :favorite_cities
  has_many :gyms, through: :gym_cities
  has_many :groceries, through: :grocery_cities

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # CSVable implementation
  def self.csv_headers
    [
      'City Name', 'Crime Index', 'Property Crime', 'Violent Crime',
      'IL School Score', 'US School Score', 'Quarter Appreciation',
      '1 Year Appreciation', '2 Years Appreciation', '5 Years Appreciation',
      '10 Years Appreciation', 'Since 2000 Appreciation', 'Median Home Value',
      'Rental Value', 'Metra', 'Grocery', 'Gym'
    ]
  end

  def self.csv_row(city)
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

    row
  end

  # Instance Methods
  def address
    [city_name, 'IL', 'USA'].compact.join(', ')
  end

  def average_rating
    reviews.any? ? reviews.average(:ratings).to_f.round(2) : 0
  end

  def reviews_count
    reviews.count
  end

  # Ransack configuration
  def self.ransackable_associations(auth_object = nil)
    %w[appreciation_values crime_rates school_grades language_cities gym_cities prices metras grocery_cities]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[city_name latitude longitude state]
  end

  private

  def address_changed?
    city_name_changed? || state_changed?
  end
end
