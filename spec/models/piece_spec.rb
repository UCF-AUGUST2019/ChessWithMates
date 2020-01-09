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
    expect{piece1.obstructed?(3, 7)}.to raise_error(RuntimeError)
  end
  # !CAPTURE
  it 'takes in the desired space and current player and sets the piece at the goal to captured' do
  	user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    piece1 = FactoryBot.create(:piece, game: game1, player_id: user1.id)
    piece1.capture
    expect(piece1.captured).to eq(true)
  end
end
