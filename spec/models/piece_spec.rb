require 'rails_helper'

RSpec.describe Piece, type: :model do
  # !HORZ?
  it 'takes in desired destination(goal) and compares to piece current position to check if HORIZONTAL' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.horz?(7, 4)).to eq(true)
    expect(piece1.horz?(4, 7)).to eq(false)
  end
  # !VERT?
  it 'takes in desired destination(goal) and compares to piece current position to check if VERTICAL' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.vert?(7, 4)).to eq(false)
    expect(piece1.vert?(4, 7)).to eq(true)
  end
  # !DIAG?
  it 'takes in desired destination(goal) and compares to piece current position to check if DIAGONIAL' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.diag?(7, 4)).to eq(false)
    expect(piece1.diag?(3, 5)).to eq(true)
    expect(piece1.diag?(5, 5)).to eq(true)
  end
  # !INVALID?
  it 'takes in desired destination(goal) and compares to piece current position to check if INVALID' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.invalid?(1, 5)).to eq(true)
    expect(piece1.invalid?(6, 6)).to eq(false)
  end
  # !HOR
  it 'should test if there is an obstruction horizontally' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.hor(7, 4)).to eq(false)
    piece2 = FactoryBot.create(:piece, x_pos: 6, game: game1, player_id: user1.id)
    expect(piece1.hor(7, 4)).to eq(true)
  end
  # !VERT
  it 'should test if there is an obstruction vertically' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.vert(4, 7)).to eq(false)
    piece2 = FactoryBot.create(:piece, y_pos: 6, game: game1, player_id: user1.id)
    expect(piece1.vert(4, 7)).to eq(true)
  end
  # !DIAG
  it 'should test if there is an obstruction diagonally' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.diag(2, 6)).to eq(false)
    expect(piece1.diag(6, 6)).to eq(false)
    piece2 = FactoryBot.create(:piece, x_pos: 3, y_pos: 5, game: game1, player_id: user1.id)
    piece3 = FactoryBot.create(:piece, x_pos: 5, y_pos: 5, game: game1, player_id: user1.id)
    expect(piece1.diag(2, 6)).to eq(true)
    expect(piece1.diag(6, 6)).to eq(true)
  end
  # !OBSTRUCTED?
  it 'takes in desired destination(goal) and compares to piece current position to check if all of the above' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    expect(piece1.obstructed?(4, 7)).to eq(false)
    expect(piece1.obstructed?(7, 4)).to eq(false)
    expect(piece1.obstructed?(3, 5)).to eq(false)
    expect(piece1.obstructed?(3, 7)).to eq("Invalid choice. Please choose again")
  end
  # !CAPTURE
  it 'takes in the desired space and current player and sets the piece at the goal to captured' do
  	user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    piece1.capture
    expect(piece1.captured).to eq(true)
  end
  # !MOVE
  it 'should successfully update (turn) if valid move is legit' do
    game1 = Game.create!(white_id: 1, black_id: 2, turn: 1)
    piece1 = Rook.create!(game_id: game1.id, player_id: 1, x_pos: 4, y_pos: 4, color: 'White')
    piece2 =  Rook.create!(game_id: game1.id, player_id: 2, x_pos: 5, y_pos: 5, color: 'Black')
    King.create!(color: 'White', game_id: game1.id, player_id: 1, x_pos: 1, y_pos: 1)
    King.create!(color: 'Black', game_id: game1.id, player_id: 2, x_pos: 8, y_pos: 8)
    piece1.move(4, 5)
    game1 = Game.last
    expect(game1.turn).to eq(2)
  end
  #!CAN_MOVE?
  it 'should only allow one player to move according to their turn' do
    game1 = Game.create!(white_id: 1, black_id: 2, turn: 1)
    piece1 = Rook.create!(game_id: game1.id, player_id: 1, x_pos: 4, y_pos: 4, color: 'White')
    piece2 =  Rook.create!(game_id: game1.id, player_id: 2, x_pos: 5, y_pos: 5, color: 'Black')
    King.create!(color: 'White', game_id: game1.id, player_id: 1, x_pos: 1, y_pos: 1)
    King.create!(color: 'Black', game_id: game1.id, player_id: 2, x_pos: 8, y_pos: 8)
    expect(piece1.can_move?).to eq(true)
    expect(piece2.can_move?).to eq(false)
  end
end
