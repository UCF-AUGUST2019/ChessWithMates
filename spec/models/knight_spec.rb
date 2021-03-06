require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe "valid moves" do 
    it "should move validly" do
      game1 = Game.create(white_id: 1, black_id: 2)
      piece1 = Knight.create(game: game1, player_id: game1.white_id, x_pos: 4, y_pos: 4, color: 'White', num_moves: 0)

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
      King.create(game: game1, player_id: game1.white_id, y_pos: 6, x_pos: 6, color: 'White')
      Queen.create(game: game1, player_id: game1.black_id, y_pos: 6, x_pos: 4, color: 'Black')
      expect(piece1.move(5, 6)).to eq(true)
    end
  end
end

