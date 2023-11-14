# spec/integration/post_index_spec.rb

require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  scenario 'User visits the post index page' do
    user = create(:user)
    post1 = create(:post, author: user, title: 'Post Title 1', text: 'Post Content 1', comments_counter: 2, likes_counter: 3)

    visit posts_path

    expect(page).to have_http_status(200)
    expect(page).to have_content('Post Profile')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts #{user.posts_counter}")
    expect(page).to have_content("Post #1")
    expect(page).to have_content('Post Content 1')
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Likes: 3')
    expect(page).to have_content('Pagination')
  end
end
