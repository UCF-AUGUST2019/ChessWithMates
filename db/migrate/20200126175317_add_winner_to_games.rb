class AddWinnerToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :winner, :integer
    add_index :games, :winner
  end
end
