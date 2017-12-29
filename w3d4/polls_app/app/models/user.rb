class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :polls,
  class_name: :Poll,
  primary_key: :id,
  foreign_key: :author_id

  has_many :responses,
  class_name: :Response,
  primary_key: :id,
  foreign_key: :response_id

end
