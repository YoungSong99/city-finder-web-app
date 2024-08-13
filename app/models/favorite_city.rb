# == Schema Information
#
# Table name: favorite_cities
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#  user_id    :integer
#
class FavoriteCity < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"

  delegate :city_name, :crime_rates, :school_grades, :appreciation_values,
           :prices, :metras, :grocery_cities, :gym_cities, to: :city
end
