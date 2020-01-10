class AddHasMovedToPieces < ActiveRecord::Migration[5.2]
  def change
	  add_column :pieces, :has_moved, :boolean
  end
end
