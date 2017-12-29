class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  has_many :taggings,
  class_name: :Tagging,
  primary_key: :id,
  foreign_key: :tag_topic_id

  has_many :tagged_urls,
  through: :taggings,
  source: :shortened_urls

  def popular_links
    urls = self.tagged_urls.joins(:visits)


    urls.order("COUNT(visits.id) DESC")
    urls

    array = urls.map do |url|
      [url, url.num_clicks]
    end

    array.order { |a, b| a[1] <=> b[1] }
    array[0..4]

    # tagged_urls.joins(:visits)
    #     .group(:short_url)
    #     .order("COUNT(visits.id) DESC")
    #     .select('long_url, short_url, COUNT(visits.id) AS number_of_visits')
    #     .limit(5)
  end


end
