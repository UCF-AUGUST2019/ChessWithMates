require 'rails_helper'
require 'rspec/rails'

RSpec.describe GamesController, type: :controller do
	
	describe 'game#show action' do
		it 'should require sign in to show the gameboard' do
			game = FactoryBot.create(:game)
			get :show, params: { id: game.id }
      expect(response).to have_http_status(302)
    end
  end
end
