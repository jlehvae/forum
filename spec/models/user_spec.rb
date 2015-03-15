require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be saved with a username" do
    user = User.create(username: "test")

    expect(user).to be_valid
  end
end
