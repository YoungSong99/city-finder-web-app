# == Schema Information
#
# Table name: language_cities
#
#  id          :bigint           not null, primary key
#  percentage  :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  city_id     :integer
#  language_id :integer
#
class LanguageCity < ApplicationRecord
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"
  belongs_to :language, required: true, class_name: "Language", foreign_key: "language_id"
end
