require 'rails_helper'

RSpec.describe "Objectives", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/objectives/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/objectives/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/objectives/create"
      expect(response).to have_http_status(:success)
    end
  end

end
