# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  category   :string
#  email      :string
#  message    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contact < ApplicationRecord
end
