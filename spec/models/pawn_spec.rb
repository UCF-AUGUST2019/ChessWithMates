require 'rails_helper'

RSpec.describe Pawn, type: :model do
	before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end
  # !MOVE?
  it 'checks if the entered move is valid and the first move, then moves the pawn 2 spaces' do
    piece1 = Pawn.create(game_id: 1, player_id: 1, x_pos: 4, y_pos: 4, color: 'Black', has_moved: false, num_moves: 0)
    Queen.create(game_id: 1, player_id: 2, x_pos: 5, y_pos: 3, color: 'White')
    King.create(game_id: 1, player_id: 1, x_pos: 3, y_pos: 1, color: 'Black')
    piece2 = Pawn.create(game_id: 1, player_id: 2, x_pos: 3, y_pos: 1, color: 'White', has_moved: true, captured: false, num_moves: 0)
    expect(piece1.move(4, 2)).to eq(true)
  end
  it 'checks if the entered move is moving backwards and returns invalid' do
    piece1 = Pawn.create(game_id: 1, player_id: 1, x_pos: 4, y_pos: 4, color: 'Black', num_moves: 1)
    King.create(game_id: 1, player_id: 1, x_pos: 3, y_pos: 1, color: 'Black')
    expect(piece1.move(5, 5)).to eq('Invalid move. Try again: ')
    expect(piece1.move(4, 5)).to eq('Invalid move. Try again: ')
  end
  it 'checks if the entered move is valid, either as an attack or a standard pawn move' do
    piece1 = Pawn.create(game_id: 2, player_id: 2, x_pos: 4, y_pos: 4, has_moved: true, color: 'Black', num_moves: 1)
    King.create(game_id: 2, player_id: 2, x_pos: 5, y_pos: 4, color: 'Black')
    Queen.create(game_id: 2, player_id: 3, x_pos: 2, y_pos: 1, color: 'White')
    expect(piece1.move(4, 3)).to eq(true)  
  end
  it 'checks if en passant works' do
    piece1 = Pawn.create(game_id: 2, player_id: 2, x_pos: 5, y_pos: 4, has_moved: true, color: 'Black', has_moved: true, num_moves: 2, captured: false)
    piece2 = Pawn.create(game_id: 2, player_id: 3, x_pos: 6, y_pos: 2, color: 'White', has_moved: false, num_moves: 0, captured: false)
    King.create(game_id: 2, player_id: 2, x_pos: 1, y_pos: 1, color: 'Black')
    King.create(game_id: 2, player_id: 3, x_pos: 8, y_pos: 8, color: 'White')
    piece2.move(6, 4)
    piece1.en_passant
    expect(piece1.y_pos).to eq(3)
    expect(piece1.x_pos).to eq(6)
    piece2 = Pawn.find_by(color: 'White')
    expect(piece2.captured).to eq(true)
  end
  it 'checks if the entered move is valid, either as an attack or a standard pawn move' do
    piece1 = Pawn.create(game_id: 2, player_id: 2, x_pos: 4, y_pos: 4, has_moved: true, color: 'Black', num_moves: 1)
    King.create(game_id: 2, player_id: 2, x_pos: 5, y_pos: 4, color: 'Black')
    Pawn.create(game_id: 2, player_id: 3, x_pos: 3, y_pos: 3, color: 'White', captured: false)
    expect(piece1.move(3, 3)).to eq(true)
    piece2 = Piece.find_by(game_id: 2, player_id: 3, x_pos: 3, y_pos: 3, color: 'White')
    expect(piece2.captured).to eq(true)
  end
end
