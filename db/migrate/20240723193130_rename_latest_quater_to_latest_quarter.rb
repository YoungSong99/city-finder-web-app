class RenameLatestQuaterToLatestQuarter < ActiveRecord::Migration[7.1]
  def change
    rename_column :appreciation_values, :latest_quater, :latest_quarter
  end
end
