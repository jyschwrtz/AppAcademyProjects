class Goal < ApplicationRecord
  validates :body, :user_id, presence: true
  belongs_to :user
end
