require 'rails_helper'

RSpec.describe Game, type: :model do
  context "available scope test" do
    it "should only show available games" do
      Game.create!
      # binding.pry
      expect(Game.available.size).to eq (1)
      
      Game.create!(white_id: 1, black_id: 2)
      expect(Game.available.size).to eq(1)
    end
  end

  # describe "#turn?"do
  #   it "should only allow white player to move first at creation of game" do
      
  #   end

  #   it "should only allow player whose turn it is to move a piece" do
      
  #   end

  #   it "should change turn once player has made a valid move"
  # end

  # describe "#populate_board!" do
  # 	it "should add 32 pieces to the game" do
  # 		game = Game.create!
  # 		expect(game.pieces.count).to eq(32)
  # 	end
  # end

end
