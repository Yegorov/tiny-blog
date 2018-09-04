require 'rails_helper'

RSpec.describe "Post", type: :request do
  describe "GET /post" do
    let(:post) { Post.new(id: 1) }
    before do
      get post_path(post.id)
    end
    it "show sample post with 200 status" do
      expect(response).to have_http_status(200)
    end
    it "include content 'Never in all their history'" do
      expect(response.body).to include("Never in all their history")
    end
  end
end
