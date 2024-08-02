# == Schema Information
#
# Table name: prices
#
#  id                :bigint           not null, primary key
#  median_home_value :integer
#  rental_value      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  city_id           :integer
#
class Price < ApplicationRecord
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"

end
