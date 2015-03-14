class User < ActiveRecord::Base
  has_many :discussions
  has_many :posts
end
