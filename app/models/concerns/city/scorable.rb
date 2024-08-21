module City::Scorable
  extend ActiveSupport::Concern

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

  def convenience_score
    gym_count = gyms.count
    grocery_count = groceries.count
    convenience_score = gym_count + grocery_count
    max_convenience_value = 27 # Max value for convenience score
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
