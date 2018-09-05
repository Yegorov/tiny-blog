# == Schema Information
#
# Table name: pages
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  enabled    :boolean          default(TRUE)
#  slug       :string           not null
#  subtitle   :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint(8)
#
# Indexes
#
#  index_pages_on_author_id  (author_id)
#  index_pages_on_slug       (slug) UNIQUE
#  index_pages_on_title      (title)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#

require 'rails_helper'

RSpec.describe Page, type: :model do
  context "shared slugs" do
    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:page) { FactoryBot.build_stubbed(:page, author: user) }

    it "must generate slug before valid" do
      page.valid?
      expect(page.slug).to be_present
    end

    it "must generate correct cyrillic slug" do
      user = FactoryBot.build(:user)
      page = FactoryBot.build(:page, title: "кирилические символы", author: user)
      page.valid?
      expect(page.slug).to be_present
      expect(page.slug).to eq("kirilicheskie-simvoly")
    end
  end
end
