require 'rails_helper'

RSpec.describe Queen, type: :model do
  # !MOVE?
  it 'checks if desired move is horz, vert or diag' do
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, type: 'Queen')

    piece1 = Piece.where(game: game1, type: 'Queen').last
    expect(piece1.move?(4, 7)).to eq(true)
    expect(piece1.move?(7, 4)).to eq(true)
    expect(piece1.move?(1, 7)).to eq(true)
    expect(piece1.move?(7, 7)).to eq(true)
    expect(piece1.move(6, 3)).to eq('Invalid move. Try again: ')
    expect(piece1.move(3, 6)).to eq('Invalid move. Try again: ')
  end
end
