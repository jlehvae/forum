require 'rails_helper'

RSpec.describe Post, type: :model do
  it "can be saved with a description" do
    post = Post.create(description: "test")

    expect(post).to be_valid
  end
end
