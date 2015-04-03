require 'rails_helper'

describe "Like" do

  before :each do
    @user = User.create(username: 'test')
    page.set_rack_session(:user_id => @user.id)
    @discussion = Discussion.create(title: 'test discussion')
    Post.create(description: 'this is a test description!', user: @user, discussion: @discussion)
  end

  it 'can be added to post as positive' do
    visit main_app.discussion_path Discussion.first
    expect(page).to have_content('this is a test description!')

    expect{
      page.find_link('+0').click
    }.to change { Like.count }.from(0).to(1)

    expect(page).to have_content('+1')
  end

  it 'can be added to post as negative' do
    visit main_app.discussion_path Discussion.first
    expect(page).to have_content('this is a test description!')

    expect{
      page.find_link('-0').click
    }.to change { Like.count }.from(0).to(1)

    expect(page).to have_content('-1')
  end

end