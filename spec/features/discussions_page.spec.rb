require 'rails_helper'

describe "Discussions page"  do
  it "should not have any discussions before any has been created" do
    visit discussions_path
    expect(page).to have_content 'Discussions'
    expect(page).to_not have_content 'started by'
  end

  it "shows discussions" do
    user = User.create(username: "jykke")
    discussion = Discussion.create(title: "title", user: user)

    visit discussions_path
    expect(page).to have_content 'Discussions'
    expect(page).to have_content 'started by jykke'
  end

  it "can click discussions" do
    user = User.create(username: "jykke")
    discussion = Discussion.create(title: "title", user: user)

    visit discussions_path
    click_link('title')

    expect(page).to have_content 'title'
  end

end