class ChangeUserFamilyTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :user_family_type, :text
    add_column :users, :user_family_type, :string, array: true, default: []
  end
end
