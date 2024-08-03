class CreateLanguageCities < ActiveRecord::Migration[7.1]
  def change
    create_table :language_cities do |t|
      t.integer :language_id
      t.integer :city_id
      t.float :percentage

      t.timestamps
    end
  end
end
