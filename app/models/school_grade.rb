# == Schema Information
#
# Table name: school_grades
#
#  id                   :bigint           not null, primary key
#  score_compared_to_il :integer
#  score_compared_to_us :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  city_id              :integer
#
class SchoolGrade < ApplicationRecord
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"

  def self.ransackable_attributes(auth_object = nil)
    ["score_compared_to_il", "score_compared_to_us"]
  end
end
