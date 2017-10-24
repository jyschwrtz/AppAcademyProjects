class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :artist_id, uniqueness: { scope: :title,
    message: "Should be unique title for artist"}

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: 'User'

  has_many :artwork_shares,
  class_name: :ArtworkShare,
  primary_key: :id,
  foreign_key: :artwork_id

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

end
