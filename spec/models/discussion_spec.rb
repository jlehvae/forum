require 'rails_helper'

RSpec.describe Discussion, type: :model do
  it "can be saved with a title" do
    d = Discussion.create(title: "test")

    expect(d).to be_valid
  end

  it "can not be saved without a title" do
    d = Discussion.create(title: "")

    expect(d).to_not be_valid
  end

  it "can not be saved if title shorter than 3" do
    d = Discussion.create(title: "12")

    expect(d).to_not be_valid
  end

  it "can not be saved if title longer than 50" do
    d = Discussion.create(title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")

    expect(d).to_not be_valid
  end

  it "can contain 1 post" do
    d = Discussion.create(title: "test")
    post = Post.new(description: "message is very nice")
    d.posts << post

    expect(d).to be_valid
    expect(d.posts.count).to eq(1)
  end

  it "can contain n posts" do
    d = Discussion.create(title: "test")
    post = Post.new(description: "message is very nice")
    post2 = Post.new(description: "message is very nice")
    post3 = Post.new(description: "message is very nice")
    d.posts << post
    d.posts << post2
    d.posts << post3

    expect(d).to be_valid
    expect(d.posts.count).to eq(3)
  end

  it "can have 0 posts" do
    d = Discussion.create(title: "test")

    expect(d).to be_valid
    expect(d.posts.count).to eq(0)
  end
end
