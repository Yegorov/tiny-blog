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
require 'shared/generate_slugs'

RSpec.describe Page, type: :model do
  include_examples 'Generate slugs', :title, :slug do
    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:resource) { FactoryBot.build_stubbed(:page, author: user) }
  end
end
