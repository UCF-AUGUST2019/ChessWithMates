require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe "valid moves" do 
    it "should move validly" do
      game1 = FactoryBot.create(:game)
      FactoryBot.create(:piece, game: game1, type: 'Knight')
      piece1 = Piece.where(game: game1, type: 'Knight').first
      expect(piece1.move?(5, 6)).to eq(true)
      expect(piece1.move?(6, 5)).to eq(true)
      expect(piece1.move?(5, 2)).to eq(true)
      expect(piece1.move?(2, 5)).to eq(true)
      expect(piece1.move?(6, 3)).to eq(true)
      expect(piece1.move?(3, 6)).to eq(true)
      expect(piece1.move?(2, 3)).to eq(true)
      expect(piece1.move?(3, 2)).to eq(true)

      expect(piece1.move?(4, 5)).to eq(false)
      expect(piece1.move?(5, 5)).to eq(false)
      expect(piece1.move?(6, 6)).to eq(false)
      expect(piece1.move?(0, 7)).to eq(false)

    end
  end
end

