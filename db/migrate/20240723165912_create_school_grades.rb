class CreateSchoolGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :school_grades do |t|
      t.integer :city_id
      t.integer :score_compared_to_us
      t.integer :score_compared_to_il

      t.timestamps
    end
  end
end
