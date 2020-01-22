require 'rails_helper'
RSpec.describe Bishop, type: :model do
  before :each do 
    allow_any_instance_of(Game).to receive(:populate_board!)
  end

  describe "Valid moves" do
    it "should move validly" do
      game1 = FactoryBot.create(:game)
      FactoryBot.create(:piece, game: game1, type: 'Bishop')
      piece1 = Piece.where(game: game1, type: 'Bishop').last
      expect(piece1.move(1, 1)).to eq(true)
    end
  end
end
