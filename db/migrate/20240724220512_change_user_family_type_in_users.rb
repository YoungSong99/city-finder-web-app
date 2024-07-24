class ChangeUserFamilyTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :user_family_type, []
  end
end
