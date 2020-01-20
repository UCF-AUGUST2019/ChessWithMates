require 'rails_helper'

RSpec.describe Pawn, type: :model do
	before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end
  # !MOVE?
  it 'checks if the entered move is valid and the first move, then moves the pawn 2 spaces' do
    piece1 = Pawn.create(game_id: 1, player_id: 1, x_pos: 4, y_pos: 4, color: 'White', has_moved: false)
    Queen.create(game_id: 1, player_id: 2, x_pos: 5, y_pos: 3, color: 'Black')
    King.create(game_id: 1, player_id: 1, x_pos: 3, y_pos: 1, color: 'White')
    expect(piece1.move(4, 2)).to eq(true) 
  end
  it 'checks if the entered move is moving backwards and returns invalid' do
    piece1 = Pawn.create(game_id: 1, player_id: 1, x_pos: 4, y_pos: 4)
    expect(piece1.move(5, 5)).to eq('Invalid move. Try again: ')
    expect(piece1.move(4, 5)).to eq('Invalid move. Try again: ')
  end
  it 'checks if the entered move is valid, either as an attack or a standard pawn move' do
    piece1 = Pawn.create(game_id: 2, player_id: 2, x_pos: 4, y_pos: 4, has_moved: true, color: 'Black')
    King.create(game_id: 2, player_id: 2, x_pos: 5, y_pos: 4, color: 'Black')
    Queen.create(game_id: 2, player_id: 2, x_pos: 2, y_pos: 1, color: 'White')
    expect(piece1.move(4, 3)).to eq(true)
    expect(piece1.move(3, 2)).to eq(true)   
  end
end
