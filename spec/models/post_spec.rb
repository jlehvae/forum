require 'rails_helper'

RSpec.describe Post, type: :model do
  it "can be saved with a description" do
    post = Post.create(description: "test test test test test")

    expect(post).to be_valid
  end

  it "can not be saved without a description" do
    post = Post.create(description: "")

    expect(post).to_not be_valid
  end

  it "can not be saved with too short description" do
    post = Post.create(description: "short")

    expect(post).to_not be_valid
  end
end
