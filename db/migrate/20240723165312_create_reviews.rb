class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :city_id
      t.text :pros
      t.text :cons
      t.text :recommend_family_type
      t.integer :ratings
      t.integer :zipcode

      t.timestamps
    end
  end
end
