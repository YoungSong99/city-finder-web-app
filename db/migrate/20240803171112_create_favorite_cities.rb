class CreateFavoriteCities < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_cities do |t|
      t.integer :user_id
      t.integer :city_id

      t.timestamps
    end
  end
end
