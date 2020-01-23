class AddNumMovesToPieces < ActiveRecord::Migration[5.2]
  def change
  	add_column :pieces, :num_moves, :integer
  end
end
