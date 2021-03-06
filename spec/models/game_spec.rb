require 'rails_helper'

RSpec.describe Game, type: :model do
  context "available scope test" do
    it "should only show available games" do
      Game.create!
      expect(Game.available.size).to eq (1)

      
      Game.create!(white_id: 1, black_id: 2)
      expect(Game.available.size).to eq(1)
    end
  end

  describe "#set_default_turn" do
    it "after game create, set opening turn 1" do
      game = Game.create!
      expect(game.turn).to eq(1)
    end
  end

  describe "#populate_board!" do
  	it "should add 32 pieces to the game" do
  		game = Game.create!
  		expect(game.pieces.count).to eq(32)
  	end
  end

end
