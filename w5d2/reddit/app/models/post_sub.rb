# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  validates :post_id, uniqueness: { scope: :sub_id }

  belongs_to :post,
    class_name: :Post,
    primary_key: :id,
    foreign_key: :post_id

  belongs_to :sub,
    class_name: :Sub,
    primary_key: :id,
    foreign_key: :sub_id


end
