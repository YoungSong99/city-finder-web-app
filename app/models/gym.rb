# == Schema Information
#
# Table name: gyms
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Gym < ApplicationRecord
  has_many  :gym_cities, class_name: "GymCity", foreign_key: "gym_id", dependent: :destroy
end
