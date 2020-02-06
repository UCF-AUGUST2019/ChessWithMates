class AddNumTiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :num_ties, :integer
    add_index :users, :num_ties
  end
end
