class ShortenedUrl < ApplicationRecord
  validates :user_id,:long_url, presence: true
  validates :short_url, uniqueness: true
  validate :no_spamming

  belongs_to :submitter,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  has_many :visits,
  class_name: :Visit,
  primary_key: :id,
  foreign_key: :shortened_url_id

  has_many :visitors,
  Proc.new { distinct },
  through: :visits,
  source: :users

  has_many :taggings,
  class_name: :Tagging,
  primary_key: :id,
  foreign_key: :shortened_url_id

  has_many :tag_topics,
  through: :taggings,
  source: :tag_topics


  def no_spamming
    user = self.submitter
    count = user.submitted_urls.where("created_at > ?", Time.now - 300).count
    if count > 5
      errors.add(:user_id, "No spamming allowed")
    else
      true
    end
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create!(user,long_url)
    shortened = ShortenedUrl.random_code
    ShortenedUrl.new(user_id: user.id, long_url: long_url, short_url: shortened)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques

    self.visits
        .where("created_at > ?", Time.now - 600)
        .distinct
        .count
  end
end
