require 'rails_helper'
RSpec.describe Bishop, type: :model do
  before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end

  describe "Valid moves" do
    it "should move validly" do
      piece1 = Bishop.create(game_id: 1, player_id: 1, x_pos: 4, y_pos: 4, color: 'White')
      King.create(game_id: 1, player_id: 1, y_pos: 1, x_pos: 2, color: 'White')
      Queen.create(game_id: 1, player_id: 2, y_pos: 6, x_pos: 2, color: 'Black')
      expect(piece1.move(2, 2)).to eq(true)
    end
  end
end
