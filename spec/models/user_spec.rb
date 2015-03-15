require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be saved with a username" do
    user = User.create(username: "test")

    expect(user).to be_valid
  end

  it "can not be saved without a username" do
    user = User.create(username: "")

    expect(user).to_not be_valid
  end

  it "can not be saved with a non unique username" do
    user = User.create(username: "test")
    user2 = User.create(username: "test")

    expect(user).to be_valid
    expect(user2).to_not be_valid
  end

  it "more than 1 users can exist if they have unique usernames" do
    user = User.create(username: "test")
    user2 = User.create(username: "test2")

    expect(user).to be_valid
    expect(user2).to be_valid
  end
end
