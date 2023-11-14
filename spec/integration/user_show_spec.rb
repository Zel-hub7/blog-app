# spec/integration/user_show_spec.rb
require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  scenario 'User visits the show page' do
    # Create a user
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)

    # Create a post associated with the user
    post = Post.create(author: user, title: 'Post Title', text: 'Post content', comments_counter: 0, likes_counter: 0)

    # Visit the user's show page
    visit user_path(user)

    # Check the HTTP status and page content
    expect(page).to have_http_status(200)

    # Check for the expected content
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts #{user.posts_counter}")

    # Check for the post content
    expect(page).to have_content('Post content')
    expect(page).to have_content('Comments: 0, Likes: 0')
  end
end
