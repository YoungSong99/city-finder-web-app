class CreateMetras < ActiveRecord::Migration[7.1]
  def change
    create_table :metras do |t|
      t.string :station
      t.string :lines
      t.integer :city_id

      t.timestamps
    end
  end
end
