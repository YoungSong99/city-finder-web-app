class CreateCrimeRates < ActiveRecord::Migration[7.1]
  def change
    create_table :crime_rates do |t|
      t.integer :city_id
      t.decimal :crime_rate
      t.decimal :violent_crime_rate
      t.decimal :property_crime_rate

      t.timestamps
    end
  end
end
