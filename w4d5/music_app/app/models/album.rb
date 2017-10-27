class Album < ApplicationRecord
  validates :title, :date, :band, presence: true
  validates :live, inclusion: { in: [true, false]}

  belongs_to :band,
  class_name: :Band,
  primary_key: :id,
  foreign_key: :band_id

  # def year=(year)
  #   self.year = year.to_i
  # end

end
