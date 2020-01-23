require 'rails_helper'
RSpec.describe Bishop, type: :model do
  before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end

  describe "Valid moves" do
    it "should move validly" do
      game1 = Game.create(white_id: 1, black_id: 2)
      piece1 = Bishop.create(game: game1, player_id: game1.white_id, x_pos: 4, y_pos: 4, color: 'White', num_moves: 0)
      King.create(game: game1, player_id: game1.white_id, y_pos: 1, x_pos: 2, color: 'White')
      Queen.create(game: game1, player_id: game1.black_id, y_pos: 6, x_pos: 2, color: 'Black')
      expect(piece1.move(2, 2)).to eq(true)
    end
  end
end
