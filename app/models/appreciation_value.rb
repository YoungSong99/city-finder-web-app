# == Schema Information
#
# Table name: appreciation_values
#
#  id             :bigint           not null, primary key
#  last_10years   :decimal(, )
#  last_12months  :decimal(, )
#  last_2years    :decimal(, )
#  last_5years    :decimal(, )
#  latest_quarter :decimal(, )
#  since_2000     :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  city_id        :integer
#
class AppreciationValue < ApplicationRecord
  belongs_to :city, class_name: "City", foreign_key: "city_id"

  def self.ransackable_attributes(auth_object = nil)
    ["last_10years", "last_12months", "last_2years","last_5years", "latest_quarter", "since_2000"]
  end
end
