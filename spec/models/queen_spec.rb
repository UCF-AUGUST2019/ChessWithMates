require 'rails_helper'

RSpec.describe Queen, type: :model do
  # !MOVE?
  it 'checks if desired move is horz, vert or diag' do
    game1 = Game.create(white_id: 1, black_id: 2)
    game1.update_attributes(turn: 2)
    piece1 = Queen.create(game: game1, player_id: game1.black_id, x_pos: 4, y_pos: 4, color: 'Black', num_moves: 0)
    expect(piece1.move?(4, 7)).to eq(true)
    expect(piece1.move?(7, 4)).to eq(true)
    expect(piece1.move?(1, 7)).to eq(true)
    expect(piece1.move?(7, 7)).to eq(true)
    expect(piece1.move?(6, 3)).to eq(false)
    expect(piece1.move?(3, 6)).to eq(false)
    King.create(game: game1, player_id: game1.white_id, y_pos: 4, x_pos: 6, color: 'Black')
    Queen.create(game: game1, player_id: game1.black_id, y_pos: 1, x_pos: 3, color: 'White')
    expect(piece1.move(4, 2)).to eq(true)
  end
end
