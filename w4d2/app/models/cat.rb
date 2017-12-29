class Cat < ApplicationRecord
  COLORS = %w(black white brown red blue)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: ['M', 'F'] }
  validates :color, inclusion: { in: COLORS }


  has_many :rental_requests, dependent: :destroy,
    class_name: :CatRentalRequest,
    primary_key: :id,
    foreign_key: :cat_id

  def age
    time_ago_in_words(birth_date)
  end
end
