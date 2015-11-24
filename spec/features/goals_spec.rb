require 'spec_helper'
require 'rails_helper'

feature "Can create new goals" do
  before :each do
    visit "/goals/new"
  end

  describe Goal do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:goal_date) }
  end

  it "creates a goal" do
    sign_up("Foo")
    sign_in("Foo")
    create_goal
    expect(page).to have_content("hello")
  end

  it "has goal attributes on show page" do
    sign_up("Foo")
    sign_in("Foo")
    create_goal
    expect(page).to have_content("hello")
    expect(page).to have_content("goodbye")
  end
end

feature "has navigator links/buttons" do
  before :each do
    sign_up("Foo")
  end

  it "index has link to create new goal" do
    expect(page).to have_link("Create New Goal")
  end

  it "show page has link back to index" do
    create_goal
    expect(page).to have_link("Back to Goals")
  end

  it "index goals link to show page" do
    create_goal
    visit '/goals'
    click_link "hello"
    expect(page).to have_content("goodbye")
  end

  it "doesn't let users see other's private goals" do
    create_secret_goal
    goal_id = Goal.last.id
    sign_out
    sign_up("bar")
    visit "goals/#{goal_id}"
    expect(page).not_to have_content("seeeecrrreeet")
  end

end
