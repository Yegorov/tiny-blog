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
  let(:user) { FactoryBot.create(:user) }

  it "must present name" do
    expect(user.name).to be_present
  end

  it "must present email" do
    pending "TODO"
    expect(user.email).to be_present
  end

  it "must present avatar" do
    pending "TODO"
    expect(user.avatar).to be_present
  end

  describe "only created" do
    it "have not posts" do
      expect(user.posts.count).to eq(0)
    end
  end

  describe "with posts" do
    let!(:posts) { FactoryBot.create_list(:post, 10, author: user) }

    it "have posts" do
      expect(user.posts.count).to eq(10)
    end
  end
end
