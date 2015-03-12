require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyString",
      :description => "MyString",
      :discussion_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "input#post_description[name=?]", "post[description]"

      assert_select "input#post_discussion_id[name=?]", "post[discussion_id]"
    end
  end
end
