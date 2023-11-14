# spec/integration/user_index_spec.rb
require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  scenario 'User visits the index page' do
    # Create a user to be displayed on the index page
    user = User.create(name: 'John Doe', photo: 'example.jpg', bio: 'A test bio', posts_counter: 0)

    # Visit the users index page
    visit users_path

    # Check the HTTP status and page content
    expect(page).to have_http_status(200)

    # Check for the expected content
    expect(page).to have_content('Routes List')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts #{user.posts_counter}")

    # Check for the user's photo
    expect(page).to have_css("img[src*='#{user.photo}'][alt='User Photo']")
  end
end
