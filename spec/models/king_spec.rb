require 'rails_helper'

RSpec.describe King, type: :model do
 	before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end
 	# !MOVE?
  it 'checks if the entered move is valid and then moves the king' do
    game1 = Game.create(white_id: 1, black_id: 2)
    piece1 = King.create(game: game1, player_id: game1.white_id, y_pos: 4, x_pos: 4, color: 'White', num_moves: 0)
    piece2 = Queen.create(game: game1, player_id: game1.black_id, y_pos: 6, x_pos: 6, color: 'Black')

    expect(piece1.move(4, 5)).to eq(true)
  end
  # !CHECK?
  it 'checks if the king is in...check' do
  	piece1 = King.create(game_id: 1, player_id: 1, y_pos: 4, x_pos: 4, color: 'White')
    piece2 = Knight.create(game_id: 1, player_id: 2, y_pos: 5, x_pos: 6, color: 'Black')
    expect(piece1.check?).to eq(true)
  end
  # !CASTLING
  it 'checks if you can queenside castle' do
  	piece1 = King.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 5, color: 'White', has_moved: false, num_moves: 0)
  	Rook.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 1, color: 'White', has_moved: false, num_moves: 0)
  	piece1.castle(1, 1)
  	expect(piece1.x_pos).to eq(3)
  end
  it 'checks if you can kingside castle' do
  	piece1 = King.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 5, color: 'White', has_moved: false, num_moves: 0)
  	Rook.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 8, color: 'White', has_moved: false, num_moves: 0)
  	piece1.castle(8, 1)
  	expect(piece1.x_pos).to eq(7)
  end
  it 'checks if you cannot castle because you would be in check in transit' do
  	piece1 = King.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 5, color: 'White', has_moved: false)
  	Rook.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 8, color: 'White', has_moved: false)
  	Rook.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 1, color: 'White', has_moved: false)
  	Rook.create(game_id: 1, player_id: 2, y_pos: 5, x_pos: 6, color: 'Black')
  	Rook.create(game_id: 1, player_id: 2, y_pos: 5, x_pos: 4, color: 'Black')
  	Bishop.create(game_id: 1, player_id: 2, y_pos: 3, x_pos: 5, color: 'Black')
  	expect(piece1.castle(8, 1)).to eq('Cannot castle through, or into check')
  	expect(piece1.castle(1, 1)).to eq('Cannot castle through, or into check')
  end
  it 'checks if you cannot castle because you are currently in check' do
  	piece1 = King.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 5, color: 'White', has_moved: false)
  	Rook.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 8, color: 'White', has_moved: false)
  	Queen.create(game_id: 1, player_id: 2, y_pos: 5, x_pos: 5, color: 'Black')
  	expect(piece1.castle(8, 1)).to eq('Cannot castle while in check')
  end
end
