require 'rails_helper'

describe "Post" do

  before :each do
    @user = User.create(username: 'test')
    page.set_rack_session(:user_id => @user.id)
    Discussion.create(title: 'test discussion')
  end

  it "can be posted to a discussion" do
    visit main_app.discussion_path Discussion.first
    expect(page).to have_content('test discussion')
    page.find_button("submit") # wait page to render

    fill_in('post_description', with: 'this is a test post!!')

    expect{
      page.find_button('submit').click
    }.to change { Post.count }.from(0).to(1)

    expect(page).to have_content('Post was successfully created.')
  end

  it "can't be posted if too short message" do
    visit main_app.discussion_path Discussion.first
    expect(page).to have_content('test discussion')
    page.find_button("submit") # wait page to render

    fill_in('post_description', with: 'fails')

    page.find_button('submit').click

    expect(page).to have_content('Description is too short')
  end

end