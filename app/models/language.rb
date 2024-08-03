# == Schema Information
#
# Table name: languages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Language < ApplicationRecord
  has_many  :language_cities, class_name: "LanguageCity", foreign_key: "language_id", dependent: :destroy
  has_many :cities, through: :language_cities
end
