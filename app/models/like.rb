class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :positive_likes, -> { where positive: true }
  scope :negative_likes, -> { where positive: [nil,false] }
end
