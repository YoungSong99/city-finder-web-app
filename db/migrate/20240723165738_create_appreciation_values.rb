class CreateAppreciationValues < ActiveRecord::Migration[7.1]
  def change
    create_table :appreciation_values do |t|
      t.decimal :latest_quater
      t.decimal :last_12months
      t.decimal :last_2years
      t.decimal :last_5years
      t.decimal :last_10years
      t.decimal :since_2000
      t.integer :city_id

      t.timestamps
    end
  end
end
