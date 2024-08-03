class CreateGroceryCities < ActiveRecord::Migration[7.1]
  def change
    create_table :grocery_cities do |t|
      t.integer :city_id
      t.integer :grocery_id

      t.timestamps
    end
  end
end
