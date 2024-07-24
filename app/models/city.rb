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


  # Ransack configuration
  def self.ransackable_associations(auth_object = nil)
    ["appreciation_values", "crime_rates", "school_grades"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["city_name"] # Add other attributes you want to be searchable
  end
end
