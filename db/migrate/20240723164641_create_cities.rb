class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :state
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
