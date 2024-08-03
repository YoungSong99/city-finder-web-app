# == Schema Information
#
# Table name: metras
#
#  id         :bigint           not null, primary key
#  lines      :string
#  station    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#
class Metra < ApplicationRecord
  belongs_to :city, required: true, class_name: "City", foreign_key: "city_id"

end
