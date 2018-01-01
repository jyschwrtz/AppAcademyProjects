# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, presence: true

  has_many :post_subs,
    class_name: :PostSub,
    primary_key: :id,
    foreign_key: :post_id,
    dependent: :destroy,
    inverse_of: :post

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :author_id

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments,
    dependent: :destroy

end
