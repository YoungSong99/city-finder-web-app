class AddIndexToCitiesLatitudeAndLongitude < ActiveRecord::Migration[7.1]
  def change
    add_index :cities, :latitude
    add_index :cities, :longitude
  end
end
