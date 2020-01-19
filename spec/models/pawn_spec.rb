require 'rails_helper'

RSpec.describe Pawn, type: :model do
	# !MOVE?
  it 'checks if the entered move is valid and the first move, then moves the pawn 2 spaces' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, player_id: user1.id, type: 'Pawn')
    piece1 = Piece.where(game: game1, player_id: user1.id, type: 'Pawn').first
    expect(piece1.move(4, 2)).to eq(true) 
  end
  it 'checks if the entered move is moving backwards and returns invalid' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, player_id: user1.id, type: 'Pawn')
    piece1 = Piece.where(game: game1, player_id: user1.id, type: 'Pawn').first
    expect(piece1.move(5, 5)).to eq('Invalid move. Try again: ')
    expect(piece1.move(4, 5)).to eq('Invalid move. Try again: ')
  end
  it 'checks if the entered move is valid, either as an attack or a standard pawn move' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, player_id: user1.id, type: 'Pawn')
    piece1 = Piece.where(game: game1, player_id: user1.id, type: 'Pawn').first
    expect(piece1.move(4, 3)).to eq(true)
    expect(piece1.move(3, 3)).to eq(true)   
  end
  # !PROMOTION
  it 'promotes a pawn to a new piece type' do
    Piece.create(player_id: 2, type: 'Pawn', x_pos: 4, y_pos: 8)
    piece1 = Piece.find_by(x_pos: 4, y_pos: 8)
    piece1.promote('Queen')
    expect(piece1.type).to eq('Queen')
  end
end
