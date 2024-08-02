# == Schema Information
#
# Table name: gym_cities
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#  gym_id     :integer
#
class GymCity < ApplicationRecord
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"
  belongs_to :gym, required: true, class_name: "Gym", foreign_key: "gym_id"
end
