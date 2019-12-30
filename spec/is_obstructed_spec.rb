require 'spec_helper'
require './is_obstructed_simon'

# require 'rails_helper'
RSpec.describe Piece, type: :model do
  # !HORZ?
  it 'takes in desired destination(goal) and compares to piece current position to check if HORIZONTAL' do
    piece1 = FactoryBot.create(:piece)
    expect(piece1.horz?(piece1, 7, 4)).to eq(true)
    expect(piece1.horz?(piece1, 4, 7)).to eq(false)
  end
  # !VERT?
  it 'takes in desired destination(goal) and compares to piece current position to check if VERTICAL' do
    piece1 = FactoryBot.create(:piece)
    expect(piece1.vert?(piece1, 7, 4)).to eq(false)
    expect(piece1.vert?(piece1, 4, 7)).to eq(true)
  end
  # !DIAG?
  it 'takes in desired destination(goal) and compares to piece current position to check if DIAGONIAL' do
    piece1 = FactoryBot.create(:piece)
    expect(piece1.diag?(piece1, 7, 4)).to eq(false)
    expect(piece1.diag?(piece1, 5, 7)).to eq(true)
  end
  # !INVALID?
  it 'takes in desired destination(goal) and compares to piece current position to check if INVALID' do
    piece1 = FactoryBot.create(:piece)
    expect(piece1.invalid?(piece1, 1, 5)).to eq(false)
    expect(piece1.invalid?(piece1, 6, 6)).to eq(true)
  end
end