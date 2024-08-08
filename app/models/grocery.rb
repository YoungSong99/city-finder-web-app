# == Schema Information
#
# Table name: groceries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Grocery < ApplicationRecord
  has_many  :grocery_cities, class_name: "GroceryCity", foreign_key: "grocery_id", dependent: :destroy
  has_many :cities, through: :grocery_cities
end
