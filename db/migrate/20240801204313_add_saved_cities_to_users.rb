class AddSavedCitiesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :saved_cities, :text
  end
end
