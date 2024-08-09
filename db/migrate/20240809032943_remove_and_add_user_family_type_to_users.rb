class RemoveAndAddUserFamilyTypeToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :user_family_type, :text
    add_column :users, :user_family_type, :text, array: true, default: []
  end
end
