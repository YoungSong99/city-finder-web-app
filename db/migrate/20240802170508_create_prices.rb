class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.integer :median_home_value
      t.integer :rental_value
      t.integer :city_id

      t.timestamps
    end
  end
end
