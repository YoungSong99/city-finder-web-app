# == Schema Information
#
# Table name: grocery_cities
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#  grocery_id :integer
#
class GroceryCity < ApplicationRecord
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"
  belongs_to :grocery, required: true, class_name: "Grocery", foreign_key: "grocery_id"
end
