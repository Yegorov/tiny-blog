# == Schema Information
#
# Table name: posts
#
#  id                      :bigint(8)        not null, primary key
#  content                 :text
#  date                    :datetime
#  enabled                 :boolean          default(TRUE)
#  reading_time_estimation :integer
#  slug                    :string           not null
#  subtitle                :string
#  title                   :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  author_id               :bigint(8)
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_slug       (slug) UNIQUE
#  index_posts_on_title      (title)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#

require 'rails_helper'
require 'shared/generate_slugs'

RSpec.describe Post, type: :model do
  include_examples 'Generate slugs', Post
end
