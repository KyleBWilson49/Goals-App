require 'spec_helper'
require 'rails_helper'

feature "Can create comments on goals" do
  before :each do
    sign_up("Harry")
    create_goal
    sign_out
    sign_up("Larry")
    visit goal_url(1)
  end

  it "has form to add comment" do
    expect(page).to have_content("Add Comment")
  end

  it "adds comment successfully" do
    add_comment
    expect(page).to have_content("This is a comment")
  end
end
