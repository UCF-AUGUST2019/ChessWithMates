require 'rails_helper'

RSpec.describe Queen, type: :model do
  it 'checks if desired move is horz, vert or diag' do
    user = FactoryBot.create(:user)
    game = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game, player_id: user.id, type: 'King')
    piece = Piece.where(game: game, player_id: user.id, type: 'Queen').first
    expect(piece.move(4, 7)).to eq(true)
    expect(piece.move(7, 4)).to eq(true)
    expect(piece.move(1, 7)).to eq(true)
    expect(piece.move(7, 7)).to eq(true)
    expect(piece.move(6, 3)).to eq(false)
    expect(piece.move(3, 6)).to eq(false)
  end
end
