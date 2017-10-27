class Track < ApplicationRecord
  validates :title, :ord, :band, :album, presence: true
  validates :album_id, uniqueness: { scope: :ord }

  belongs_to :album,
  class_name: :Album,
  primary_key: :id,
  foreign_key: :album_id

  has_one :band,
  through: :album,
  source: :band
end
