# == Schema Information
#
# Table name: reviews
#
#  id                    :bigint           not null, primary key
#  cons                  :text
#  pros                  :text
#  ratings               :integer
#  recommend_family_type :text
#  zipcode               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  city_id               :integer
#  user_id               :integer
#
class Review < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"

  validates :ratings, inclusion: { in: 1..5 }
end
