require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  scenario 'User visits the show page' do
    # Create a user
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)

    # Create a few posts associated with the user
    Post.create(author: user, title: 'Post Title 1', text: 'Post content 1', comments_counter: 1,
                likes_counter: 5)
    Post.create(author: user, title: 'Post Title 2', text: 'Post content 2', comments_counter: 3,
                likes_counter: 10)
    Post.create(author: user, title: 'Post Title 3', text: 'Post content 3', comments_counter: 2,
                likes_counter: 8)

    # Visit the user's show page
    visit user_path(user)

    # Check the HTTP status and page content
    expect(page).to have_http_status(200)

    # Check for the expected content
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts #{user.posts_counter}")

    # Check for the user's profile picture
    expect(page).to have_css("img[src*='#{user.photo}'][alt='User Photo']")
  end

  it 'displays the user\'s bio' do
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)
    visit user_path(user)

    # Check for the user's bio
    expect(page).to have_content(user.bio)
  end

  it 'displays the titles of the user\'s first 3 posts' do
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)
    post1 = Post.create(author: user, title: 'Post Title 1', text: 'Post content 1', comments_counter: 1,
                        likes_counter: 5)
    post2 = Post.create(author: user, title: 'Post Title 2', text: 'Post content 2', comments_counter: 3,
                        likes_counter: 10)
    post3 = Post.create(author: user, title: 'Post Title 3', text: 'Post content 3', comments_counter: 2,
                        likes_counter: 8)

    visit user_path(user)

    # Check for the titles of the user's first 3 posts
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)

    # Ensure only 3 posts are displayed
    expect(page).to have_selector('.post', count: 3)
  end

  it 'redirects to the post show page when a user\'s post is clicked' do
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)
    post1 = Post.create(author: user, title: 'Post Title 1', text: 'Post content 1', comments_counter: 1,
                        likes_counter: 5)

    visit user_path(user)

    # Click on the title of the first post
    click_link post1.title

    # Check that we are redirected to the post show page
    expect(page).to have_current_path(user_post_path(user_id: user.id, id: post1.id))
  end
end
