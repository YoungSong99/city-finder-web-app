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
class City < ApplicationRecord
  has_many  :crime_rates, class_name: "CrimeRate", foreign_key: "city_id", dependent: :destroy
  has_many  :reviews, class_name: "Review", foreign_key: "city_id", dependent: :destroy
  has_many  :appreciation_values, class_name: "AppreciationValue", foreign_key: "city_id", dependent: :destroy
  has_many  :school_grades, class_name: "SchoolGrade", foreign_key: "city_id", dependent: :destroy

end
