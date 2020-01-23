require 'rails_helper'

RSpec.describe Rook, type: :model do
  # !MOVE?
  it 'checks if desired move is horz or vert' do
    piece1 = Rook.create(game_id: 1, player_id: 1, x_pos: 4, y_pos: 4, color: 'White', num_moves: 0)
    expect(piece1.move?(4, 2)).to eq(true)
    expect(piece1.move?(2, 4)).to eq(true)
    expect(piece1.move(3, 5)).to eq('Invalid move. Try again: ')
    expect(piece1.move(5, 3)).to eq('Invalid move. Try again: ')
    King.create(game_id: 1, player_id: 1, x_pos: 2, y_pos: 6, color: 'White')
    Queen.create(game_id: 1, player_id: 2, x_pos: 2, y_pos: 2, color: 'Black')
    expect(piece1.move(2, 4)).to eq(true)
  end
end