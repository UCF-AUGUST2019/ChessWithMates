require 'rails_helper'

RSpec.describe Rook, type: :model do
  # !MOVE?
  it 'checks if desired move is horz or vert' do
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, type: 'Rook')

    piece1 = Piece.where(game: game1, type: 'Rook').last
    expect(piece1.move?(4, 2)).to eq(true)
    expect(piece1.move?(2, 4)).to eq(true)
    expect(piece1.move(3, 5)).to eq('Invalid move. Try again: ')
    expect(piece1.move(5, 3)).to eq('Invalid move. Try again: ')
  end
end