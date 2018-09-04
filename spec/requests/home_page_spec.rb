require 'rails_helper'

RSpec.describe "Home Page", type: :request do
  describe "GET /" do
    before do
      get root_path
    end
    it "show the main pages with 200 status" do
      expect(response).to have_http_status(200)
    end
    it "include text 'Clean Blog'" do
      expect(response.body).to include("Clean Blog")
      expect(response.body).to include("A Blog Theme by Start Bootstrap")
    end
  end
end
