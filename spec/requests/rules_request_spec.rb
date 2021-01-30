require 'rails_helper'

RSpec.describe "Rules", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/rules/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/rules/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/rules/create"
      expect(response).to have_http_status(:success)
    end
  end

end
