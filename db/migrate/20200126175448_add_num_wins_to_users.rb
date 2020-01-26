class AddNumWinsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :num_wins, :integer
    add_index :users, :num_wins
  end
end
