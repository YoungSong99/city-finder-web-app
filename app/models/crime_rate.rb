# == Schema Information
#
# Table name: crime_rates
#
#  id                  :bigint           not null, primary key
#  crime_index         :decimal(, )
#  property_crime_rate :decimal(, )
#  violent_crime_rate  :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  city_id             :integer
#
class CrimeRate < ApplicationRecord
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"

  def self.ransackable_attributes(auth_object = nil)
    ["crime_index", "property_crime_rate", "violent_crime_rate"]
  end
end
