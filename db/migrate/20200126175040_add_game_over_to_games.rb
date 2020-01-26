class AddGameOverToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_over, :boolean
    add_index :games, :game_over
  end
end
