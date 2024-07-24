class RenameCrimeRateToCrimeIndex < ActiveRecord::Migration[7.1]
  def change
    rename_column :crime_rates, :crime_rate, :crime_index
  end
end
