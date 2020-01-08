require 'rails_helper'

RSpec.describe King, type: :model do
  # !MOVE?
  it 'checks if the entered move is valid and then moves the king' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, player_id: user1.id, type: 'King')
    piece1 = Piece.where(game: game1, player_id: user1.id, type: 'King').first
    # puts piece1.class
    expect(piece1.move(5, 5)).to eq(true)
  end
end
