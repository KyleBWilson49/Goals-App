require 'spec_helper'
require 'rails_helper'

# let(:user) { FactoryGirl.create(:user) }

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      fill_in "Username", with: "Kyle"
      fill_in "Password", with: "password"
      click_button 'Sign Up'
      expect(page).to have_content 'Kyle'
    end

  end

end

feature "logging in" do

  it "shows username on the homepage after login" do
    # visit "session/new"
    sign_up("Kyle")
    sign_in("Kyle")
    expect(page).to have_content 'Kyle'
  end

end

feature "logging out" do

  it "begins with logged out state"

  it "doesn't show username on the homepage after logout"

end
