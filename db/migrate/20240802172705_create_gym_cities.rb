class CreateGymCities < ActiveRecord::Migration[7.1]
  def change
    create_table :gym_cities do |t|
      t.integer :gym_id
      t.integer :city_id

      t.timestamps
    end
  end
end
