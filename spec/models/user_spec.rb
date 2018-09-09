# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "with posts" do
    let(:user) { FactoryBot.create(:user, ) }
    it "have posts" do
      posts = FactoryBot.create_list(:post, 10, author: user)

      expect(user.posts.count).to eq(10)
    end

    it "have not posts" do
      expect(user.posts.count).to eq(0)
    end
  end
end
