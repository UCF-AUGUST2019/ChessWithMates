require 'rails_helper'

RSpec.describe King, type: :model do
 	before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end
 	# !MOVE?
  it 'checks if the entered move is valid and then moves the king' do
    user1 = FactoryBot.create(:user)
    game1 = FactoryBot.create(:game)
    FactoryBot.create(:piece, game: game1, player_id: user1.id, type: 'King')
    piece1 = Piece.where(game: game1, player_id: user1.id, type: 'King').first
    expect(piece1.move(4, 5)).to eq(true)
  end
end
