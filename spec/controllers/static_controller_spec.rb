require 'rails_helper'
require 'rspec/rails'

RSpec.describe StaticController, type: :controller do
  describe 'static#index action' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
