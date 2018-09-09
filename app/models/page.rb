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

class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: [:finders, :slugged]

  belongs_to :author, class_name: "User"

  has_one_attached :featured_image


  private

  def slug_candidates
    [
      :title,
      [:title, :subtitle],
      [:title, :subtitle, :id]
    ]
  end
end
