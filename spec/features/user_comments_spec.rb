require 'spec_helper'
require 'rails_helper'

feature "Can create comments on users" do
  before :each do
    sign_up("Moe")
    sign_out
    sign_up("Curly")
    visit user_url(1)
  end

  it "User has form for comments" do
    expect(page).to have_content("Add Comment")
  end

  it "Can add comments" do
    add_comment
    save_and_open_page
    expect(page).to have_content("This is a comment")
  end
end
