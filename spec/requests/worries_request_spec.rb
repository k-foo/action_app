require 'rails_helper'

RSpec.describe "Worries", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/worries/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/worries/create"
      expect(response).to have_http_status(:success)
    end
  end

end
