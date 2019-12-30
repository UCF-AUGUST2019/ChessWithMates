require 'rails_helper'

RSpec.describe Game, type: :model do
  context "available scope test" do 
    it "should only show available games" do
      Game.create!
      expect(Game.available.size).to eq 1
      
      Game.create!(white_id: 0, black_id: 1)
      expect(Game.available.size).to eq 1
    end
  end
end
