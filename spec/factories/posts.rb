# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  date       :datetime
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
#  index_posts_on_author_id  (author_id)
#  index_posts_on_slug       (slug) UNIQUE
#  index_posts_on_title      (title)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    subtitle { Faker::Lorem.sentence }
    date { "2018-09-05 15:31:53" }
    content { Faker::Lorem.paragraphs(10).join('\n<br/>\n') }
  end
end
