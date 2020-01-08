require 'rails_helper'
require 'rspec/rails'

RSpec.describe Game, type: :model do
  context "available scope test" do 
    it "should only show available games" do
      g1 = Game.create!
      expect(g.available.size).to eq 1
      
      g2 = g2.create!(white_id: 0, black_id: 1)
      expect(g2.available.size).to eq(1)
    end
  end

  describe "#populate_board!" do
  	it "should add 32 pieces to the game" do
  		game = Game.create!
  		game.populate_board!
  		expect(game.pieces.count).to eq(32)
  	end
  end

end
