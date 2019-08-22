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

FactoryBot.define do
  factory :page do
    title { Faker::Lorem.sentence }
    subtitle { Faker::Lorem.sentence }
    content  { Faker::Lorem.paragraphs(number: 10).join("\n<br/>\n") }

    association :author, factory: :user

    trait :disable do
      enabled { false }
    end
  end
end
