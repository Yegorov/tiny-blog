# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "must present name" do
    expect(user.name).to be_present
  end

  it "must present email" do
    expect(user.email).to be_present
  end

  xit "must present avatar" do
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
