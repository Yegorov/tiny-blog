require 'rails_helper'

RSpec.describe "Post", type: :request do
  describe "GET /post" do
    let(:post) { FactoryBot.create(:post) }
    before do
      get post_path(post)
    end
    it "show sample post with 200 status" do
      expect(response).to have_http_status(200)
    end
    it "include title" do
      expect(response.body).to include(post.title)
    end
  end
end
