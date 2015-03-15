class Post < ActiveRecord::Base
  belongs_to :discussion, touch: true
  belongs_to :user
  has_many :likes

  validates :description, presence: true, allow_blank: false

  validates :description, length: {
                      minimum: 10,
                      maximum: 1000
                  }
end
