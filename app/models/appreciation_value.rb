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
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"
end
