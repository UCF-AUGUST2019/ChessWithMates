require 'rails_helper'

RSpec.describe King, type: :model do
 	before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end
 	# !MOVE?
  it 'checks if the entered move is valid and then moves the king' do
    piece1 = King.create(game_id: 1, player_id: 1, y_pos: 4, x_pos: 4, color: 'White')
    piece2 = Queen.create(game_id: 1, player_id: 2, y_pos: 6, x_pos: 6, color: 'Black')
    expect(piece1.move(4, 5)).to eq(true)
  end
  # !CHECK?
  it 'checks if the king is in...check' do
  	piece1 = King.create(game_id: 1, player_id: 1, y_pos: 4, x_pos: 4, color: 'White')
    piece2 = Knight.create(game_id: 1, player_id: 2, y_pos: 5, x_pos: 6, color: 'Black')
    expect(piece1.check?).to eq(true)
  end
end
