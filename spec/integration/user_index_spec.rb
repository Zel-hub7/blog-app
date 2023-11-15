require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  context 'User visits the index page' do
    it 'displays user information' do
      # Create a few users to be displayed on the index page
      user1 = User.create(name: 'John Doe', photo: 'example1.jpg', bio: 'A test bio', posts_counter: 5)
      user2 = User.create(name: 'Jane Smith', photo: 'example2.jpg', bio: 'Another test bio', posts_counter: 10)

      # Visit the users index page
      visit users_path

      # Check the HTTP status and page content
      expect(page).to have_http_status(200)

      # Check for the expected content
      expect(page).to have_content('Routes List')

      # Check for user1's information
      expect(page).to have_content(user1.name)
      expect(page).to have_css("img[src*='#{user1.photo}'][alt='User Photo']")
      expect(page).to have_content("Number of posts #{user1.posts_counter}")
    end

    it 'displays user2 information' do
      # Create a user to be displayed on the index page
      user2 = User.create(name: 'Jane Smith', photo: 'example2.jpg', bio: 'Another test bio', posts_counter: 10)

      # Visit the users index page
      visit users_path

      # Check for user2's information
      expect(page).to have_content(user2.name)
      expect(page).to have_css("img[src*='#{user2.photo}'][alt='User Photo']")
      expect(page).to have_content("Number of posts #{user2.posts_counter}")
    end

    it 'redirects to the user show page when user1 is clicked' do
      # Create a user to be displayed on the index page
      user1 = User.create(name: 'John Doe', photo: 'example1.jpg', bio: 'A test bio', posts_counter: 5)

      # Visit the users index page
      visit users_path

      # Click on user1's name
      click_link user1.name

      # Check that we are redirected to user1's show page
      expect(page).to have_current_path(user_path(user1))
    end

    it 'redirects to the user show page when user2 is clicked' do
      # Create a user to be displayed on the index page
      user2 = User.create(name: 'Jane Smith', photo: 'example2.jpg', bio: 'Another test bio', posts_counter: 10)

      # Visit the users index page
      visit users_path

      # Click on user2's name
      click_link user2.name

      # Check that we are redirected to user2's show page
      expect(page).to have_current_path(user_path(user2))
    end
  end
end
