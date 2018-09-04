require 'rails_helper'

RSpec.describe "Page", type: :request do
  describe "GET /page" do
    let(:page) { Page.new(id: 1) }
    before do
      get page_path(page)
    end
    it "show sample page with 200 status" do
      expect(response).to have_http_status(200)
    end
    it 'include text "Lorem ipsum dolor sit amet"' do
      expect(response.body).to include("Lorem ipsum dolor sit amet")
    end
  end
end
