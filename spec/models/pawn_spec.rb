require 'rails_helper'

RSpec.describe Pawn, type: :model do
  # !MOVE?
  it 'checks if the entered move is valid and then moves the pawn' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, player_id: user1.id, type: 'Pawn')
    piece1 = Piece.where(game: game1, player_id: user1.id, type: 'Pawn').first
    puts piece1.class
    puts piece1.has_moved.to_s
    expect(piece1.move(4, 2)).to eq(true) 
    puts piece1.has_moved.to_s
    expect{piece1.move(5, 5)}.to raise_error('Invalid move. Try again: ')
    expect{piece1.move(4, 5)}.to raise_error('Invalid move. Try again: ')
    expect(piece1.move(4, 3)).to eq(true)
    expect(piece1.move(3, 3)).to eq(true)   
  end
end
