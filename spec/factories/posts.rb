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

FactoryBot.define do

  factory :post do
    title { Faker::Lorem.sentence }
    subtitle { Faker::Lorem.sentence }
    date { Time.zone.now }
    content { Faker::Lorem.paragraphs(number: 10).join("\n") }
    reading_time_estimation { 2.minute.value }

    association :author, factory: :user
    # before(:create) do |instance|
    #   instance.author = FactoryBot.create(:user)
    # end


    trait :with_featured_image do
      transient do
        filename { "pexels-photo-905877-medium.jpeg" }
      end
      after(:create) do |instance, evaluator|
        instance.featured_image.attach(
          io: File.open(Rails.root.join("spec/fixtures/files/#{evaluator.filename}")),
          filename: evaluator.filename)
      end
    end

    trait :with_featured_image_without_load do
      after(:create) do |instance|
        attach_name = "featured_image"
        # https://github.com/rails/rails/blob/fc5dd0b85189811062c85520fd70de8389b55aeb/activestorage/app/models/active_storage/blob.rb#L47
        blob_params = {
          #key: "4ksH85oESittrzui6udUTJfC", # storage/4k/sH/4ksH85oESittrzui6udUTJfC
          filename: "pexels-photo-905877-medium.jpeg",
          content_type: "image/jpeg",
          metadata: { "identified" => true, "analyzed" => true },
          byte_size: 0.5.megabyte,
          checksum: Digest::MD5.base64digest("pexels-photo-905877-medium.jpeg")
        }
        blob = ActiveStorage::Blob.new(blob_params)
        ActiveStorage::Attachment.create!(
          name: attach_name,
          record_type: instance.model_name.name,
          record_id: instance.id,
          blob: blob)
      end
    end

    trait :with_html_content do
      content do
        locals = {}
        t = Slim::Template.new do
          File.read(Rails.root.join("spec/fixtures/files/article_body.html.slim"))
        end
        o = Object.new
        o.singleton_class.class_eval do
          include Webpacker::Helper
          include ActionView::Helpers::AssetUrlHelper
        end
        t.render(o, locals)
      end
    end


  end
end
