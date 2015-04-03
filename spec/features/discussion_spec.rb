require 'rails_helper'

describe "Discussion" do

  before :each do
    @user = User.create(username: 'test')
    page.set_rack_session(:user_id => @user.id)
  end

  it "frontpage contains link to create a new one" do
    visit main_app.root_path
    expect(page).to have_content('New Discussion')
  end

  it "can be created under the link on frontpage" do
    visit main_app.root_path
    expect(page).to have_content('New Discussion')

    page.find_link("New Discussion").click
    expect(page).to have_content('Title')

    fill_in('discussion[title]', with: 'cool')

    expect{
      click_button('Create Discussion')
    }.to change { Discussion.count }.from(0).to(1)

    expect(page).to have_content('Discussion was successfully created')
  end

  it "can't be created with a falsy title" do
    visit main_app.root_path
    expect(page).to have_content('New Discussion')

    page.find_link("New Discussion").click
    expect(page).to have_content('Title')

    fill_in('discussion[title]', with: '')

    click_button('Create Discussion')

    expect(page).to have_content('Title is too short')
  end

end