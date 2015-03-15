require 'rails_helper'

RSpec.describe Discussion, type: :model do
  it "can be saved with a title" do
    d = Discussion.create(title: "test")

    expect(d).to be_valid
  end

  it "can contain posts" do
    d = Discussion.create(title: "test")
    post = Post.new(description: "message")
    d.posts << post

    expect(d).to be_valid
    expect(d.posts.count).to eq(1)
  end
end
