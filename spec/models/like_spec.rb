require 'rails_helper'

RSpec.describe Like, type: :model do
  it "can be created for a post by a user" do
    post = Post.create(description: "test test test test")
    user = User.create(username: "testuser")

    like = Like.create(post: post, user: user, positive: true)

    expect(like).to be_valid
  end

  it "can be positive" do
    post = Post.create(description: "test")
    user = User.create(username: "testuser")

    like = Like.create(post: post, user: user, positive: true)

    expect(like).to be_valid
  end

  it "can be negative" do
    post = Post.create(description: "test")
    user = User.create(username: "testuser")

    like = Like.create(post: post, user: user, positive: false)

    expect(like).to be_valid
  end

  it "post can have many likes" do
    post = Post.create(description: "test test test test")
    user = User.create(username: "testuser")

    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: true)

    expect(post.likes.count).to be(3)
  end

  it "positive_likes returns only positive likes" do
    post = Post.create(description: "test test test test")
    user = User.create(username: "testuser")

    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: false)
    Like.create(post: post, user: user, positive: false)

    expect(post.likes.positive_likes.count).to be(3)
  end

  it "negative_likes returns only negative likes" do
    post = Post.create(description: "test test test test")
    user = User.create(username: "testuser")

    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: true)
    Like.create(post: post, user: user, positive: false)
    Like.create(post: post, user: user, positive: false)

    expect(post.likes.negative_likes.count).to be(2)
  end
end
