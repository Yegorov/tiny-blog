require 'rails_helper'

RSpec.describe "Page", type: :request do
  describe "GET /page" do
    let(:page) { FactoryBot.create(:page) }
    before do
      get page_path(page)
    end
    it "show sample page with 200 status" do
      expect(response).to have_http_status(200)
    end
    it 'include title' do
      expect(response.body).to include("Lorem ipsum dolor sit amet")
    end
  end
end
