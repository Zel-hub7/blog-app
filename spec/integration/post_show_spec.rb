# spec/integration/post_show_spec.rb

require 'rails_helper'

RSpec.describe 'Post Details', type: :feature do
  scenario 'displays the post details' do
    # Assuming you have a user and a post set up in your database
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)
    post = Post.create(author: user, title: 'Post Title', text: 'Post content', comments_counter: 0, likes_counter: 0)

    visit user_post_path(user, post)

    # Your expectations for displaying post details
    expect(page).to have_content(post.title)
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
    expect(page).to have_content(post.text)
  end

  scenario 'displays the comments' do
    # Assuming you have a user, a post, and some comments set up in your database
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)
    post = Post.create(author: user, title: 'Post Title', text: 'Post content', comments_counter: 2, likes_counter: 0)
    comment1 = Comment.create(user: user, post: post, text: 'First comment')
    comment2 = Comment.create(user: user, post: post, text: 'Second comment')

    visit user_post_path(user, post)

    # Your expectations for displaying comments
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end

  scenario 'displays a form for adding a like' do
    # Assuming you have a user and a post set up in your database
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)
    post = Post.create(author: user, title: 'Post Title', text: 'Post content', comments_counter: 0, likes_counter: 0)

    visit user_post_path(user, post)

    # Your expectations for displaying the like form
    expect(page).to have_selector("form[action='#{user_post_likes_path(user, post)}'][method='post']")
  end

  scenario 'displays a form for adding a comment' do
    # Assuming you have a user and a post set up in your database
    user = User.create(name: 'John Doe', photo: 'user_photo.jpg', bio: 'Some bio', posts_counter: 2)
    post = Post.create(author: user, title: 'Post Title', text: 'Post content', comments_counter: 0, likes_counter: 0)

    visit user_post_path(user, post)

    # Your expectations for displaying the comment form
    expect(page).to have_selector("form[action='#{user_post_comments_path(user, post)}'][method='post']")
  end
end
