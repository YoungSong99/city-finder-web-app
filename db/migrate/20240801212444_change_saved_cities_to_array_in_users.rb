class ChangeSavedCitiesToArrayInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :saved_cities, :text
    add_column :users, :saved_cities, :text, array: true, default: []
  end
end
