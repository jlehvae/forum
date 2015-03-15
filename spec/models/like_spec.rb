require 'rails_helper'

RSpec.describe Like, type: :model do
  it "can be created for a post by a user" do
    post = Post.create(description: "test")
    user = User.create(username: "testuser")

    like = Like.create(post: post, user: user, positive: true)

    expect(like).to be_valid
  end
end
