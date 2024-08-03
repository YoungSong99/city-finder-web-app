class RemoveSavedCityFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :saved_cities, :text
  end
end
