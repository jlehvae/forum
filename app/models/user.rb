class User < ActiveRecord::Base
  has_many :discussions
  has_many :posts
  has_many :likes

  validates :username, presence: true, allow_blank: false
  validates :username, uniqueness: true
end
