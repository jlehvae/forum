class Discussion < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  has_many :likes, through: :posts

  validates :title, presence: true, allow_blank: false

  validates :title, length: {
                         minimum: 3,
                         maximum: 50
                     }
end
