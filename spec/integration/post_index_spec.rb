# spec/features/post_index_spec.rb

require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  let(:user) { User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2) }

  before do
    # Create a few posts associated with the user
    post1 = Post.create(author: user, title: 'Post Title 1', text: 'Post content 1', comments_counter: 1, likes_counter: 5)
    post2 = Post.create(author: user, title: 'Post Title 2', text: 'Post content 2', comments_counter: 3, likes_counter: 10)
  end

  it 'displays the user profile picture' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_css("img[src*='#{user.photo}'][alt='User Photo']")
  end

  it 'displays the user username' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content("Number of posts #{user.posts_counter}")
  end

  it 'displays a post title' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content('Post Title 1')
  end

  it 'displays some of the post body' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content('Post content 1')
  end

  it 'displays the first comments on a post' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content('This is a comment')
  end

  it 'displays how many comments a post has' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content('Comments: 1')
  end

  it 'displays how many likes a post has' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content('Likes: 5')
  end

  it 'displays a section for pagination' do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_css('.pagination-btn')
  end

  it 'redirects to the post show page when a post is clicked' do
    visit user_posts_path(user_id: user.id)

    click_link 'Post Title 1'

    expect(page).to have_current_path(user_post_path(user_id: user.id, id: Post.first.id))
  end
end
