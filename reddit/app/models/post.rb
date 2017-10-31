# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :sub,
    class_name: :Sub,
    primary_key: :id,
    foreign_key: :sub_id

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :author_id

end
