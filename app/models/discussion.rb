class Discussion < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  has_many :likes, through: :posts
end
