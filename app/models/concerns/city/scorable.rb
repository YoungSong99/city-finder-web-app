module City::Scorable
  extend ActiveSupport::Concern

  # This method returns a hash of scores for various attributes of a city to compare cities.
  # Each value is normalized to a full score of 100, making it easier to compare across different attributes.
  def scores
    {
      "Safety" => safety_score,
      "School" => school_score,
      "Convenience" => convenience_score,
      "Appreciation" => appreciation_score,
      "Price" => price_score
    }
  end

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

  # The score is normalized to a maximum convenience value.
  def convenience_score
    gym_count = gyms.count
    grocery_count = groceries.count
    convenience_score = gym_count + grocery_count
    max_convenience_value = 27 # Max value for convenience count (chicago)
    (convenience_score.to_f / max_convenience_value * 100).to_i
  end

  # The score is normalized to a maximum last 12 months appreciation value.
  def appreciation_score
    appreciation_value = appreciation_values.first
    max_appreciation_value = 34.77 # Max appreciation value
    appreciation_value ? ((appreciation_value.last_12months.to_f / max_appreciation_value) * 100).to_i : 0
  end

  # The score is normalized to a maximum house price.
  def price_score
    price = prices.first
    max_home_value = 1_511_784.0 # Max home value
    price ? ((price.median_home_value.to_f / max_home_value) * 100).to_i : 0
  end
end
