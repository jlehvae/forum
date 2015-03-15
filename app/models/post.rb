class Post < ActiveRecord::Base
  belongs_to :discussion, touch: true
  belongs_to :user
  has_many :likes
end
