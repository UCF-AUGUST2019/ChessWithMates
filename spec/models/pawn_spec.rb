require 'rails_helper'

RSpec.describe Pawn, type: :model do
	# !MOVE?
  it 'checks if the entered move is valid and the first move, then moves the pawn 2 spaces' do
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, color: 'White', type: 'Pawn')
    piece1 = Piece.where(game: game1, color: 'White', type: 'Pawn').last
    expect(piece1.move(4, 2)).to eq(true) 
  end
  it 'checks if the entered move is moving backwards and returns invalid' do
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, type: 'Pawn')
    piece1 = Piece.where(game: game1, type: 'Pawn').last
    expect(piece1.move(5, 5)).to eq('Invalid move. Try again: ')
    expect(piece1.move(4, 5)).to eq('Invalid move. Try again: ')
  end
  it 'checks if the entered move is valid, either as an attack or a standard pawn move' do
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, color: 'White', type: 'Pawn')
    piece1 = Piece.where(game: game1, color: 'White', type: 'Pawn').last
    expect(piece1.move(4, 3)).to eq(true)
  end
  it 'checks if the entered move is valid, either as an attack or a standard pawn move #2' do
  game1 = FactoryBot.create(:game)
  FactoryBot.create(:piece, game: game1, color: 'White', type: 'Pawn')
  piece1 = Piece.where(game: game1, color: 'White', type: 'Pawn').last
  expect(piece1.move(3, 3)).to eq(true)   
  end
end
