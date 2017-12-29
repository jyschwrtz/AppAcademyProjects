class Tagging < ApplicationRecord
  validates :tag_topic_id, :shortened_url_id, presence: true

  belongs_to :tag_topics,
  class_name: :TagTopic,
  primary_key: :id,
  foreign_key: :tag_topic_id

  belongs_to :shortened_urls,
  class_name: :ShortenedUrl,
  primary_key: :id,
  foreign_key: :shortened_url_id
end
