class Post < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  has_many :likes
end
