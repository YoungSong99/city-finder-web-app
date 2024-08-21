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

class City < ApplicationRecord
  include Csvable, Ransackable, Filterable, Rankable

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

  def scores
    {
      "Safety" => safety_score,
      "School" => school_score,
      "Convenience" => convenience_score,
      "Appreciation" => appreciation_score,
      "Price" => price_score
    }
  end

  private

  def address_changed?
    city_name_changed? || state_changed?
  end

  def safety_score
    crime_rate = crime_rates.first
    crime_rate ? crime_rate.crime_index.to_i : 0
  end

  def school_score
    school_grade = school_grades.first
    school_grade ? school_grade.score_compared_to_il.to_i * 10 : 0
  end

  def convenience_score
    gym_count = gyms.count
    grocery_count = groceries.count
    convenience_score = gym_count + grocery_count
    max_convenience_value = 27  # Max value for convenience score
    (convenience_score.to_f / max_convenience_value * 100).to_i
  end

  def appreciation_score
    appreciation_value = appreciation_values.first
    max_appreciation_value = 34.77 # Max appreciation value
    appreciation_value ? ((appreciation_value.last_12months.to_f / max_appreciation_value) * 100).to_i : 0
  end

  def price_score
    price = prices.first
    max_home_value = 1_511_784.0 # Max home value
    price ? ((price.median_home_value.to_f / max_home_value) * 100).to_i : 0
  end
end
