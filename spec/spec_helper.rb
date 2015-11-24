
RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def sign_up(username)
    visit "/users/new"
    fill_in "Username", with: username
    fill_in "Password", with: 'password'
    click_button 'Sign Up'
  end

  def sign_in(username)
    visit "/session/new"
    fill_in "Username", with: username
    fill_in "Password", with: 'password'
    click_button 'Sign In'
  end

  def sign_out
    click_button 'Sign Out'
  end

  def create_goal
    visit '/goals/new'
    fill_in "Title", with: "hello"
    fill_in "Body", with: "goodbye"
    click_button "Create Goal"
  end

  def create_secret_goal
    visit '/goals/new'
    fill_in "Title", with: "secret"
    fill_in "Body", with: "seeeecrrreeet"
    page.choose('public_false')
    click_button "Create Goal"
  end

  def add_comment
    fill_in "add_comment", with: "This is a comment"
    click_button "Add Comment"
  end
end
