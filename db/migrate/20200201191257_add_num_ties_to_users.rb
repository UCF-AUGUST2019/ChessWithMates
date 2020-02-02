class AddNumTiesToUsers < ActiveRecord::Migration[5.2]
  def change
	  add_column :users, :num_ties, :integer
  end
end
