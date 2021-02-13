require 'rails_helper'

RSpec.describe 'Rules', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/rules/index'
      expect(response).to have_http_status(:success)
    end
  end
end
