class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
    	
      t.string :name
    	t.integer :white_id
    	t.integer :black_id
      t.integer :turn

      t.timestamps
    end
  end
end
