require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @author_object = User.create(name: 'Ariel_CEO', posts_counter: 0)
  end

  it 'expects to be valid with valid attribute' do
    post_object = Post.new(title: 'Microverse School', author_id: @author_object.id, comments_counter: 0,
                           likes_counter: 0)
    expect(post_object).to be_valid
  end

  it 'should not be a valid post' do
    post_object = Post.new(title: 'Microverse School', comments_counter: 0, likes_counter: 0)
    expect(post_object).not_to be_valid
  end

  it 'should not be a valid post' do
    post_object = Post.new(title: 'Microverse School', comments_counter: 2.40, likes_counter: 2.3)
    expect(post_object).to be_invalid
  end

  it 'should not be a valid post' do
    post_object = Post.new(title: 'Microverse School', comments_counter: -2, likes_counter: -2)
    expect(post_object).to be_invalid
  end

  it 'Should respond to some methods' do
    post_object = Post.new(title: 'Microverse School', author_id: @author_object.id, text: 'My school',
                           comments_counter: 0, likes_counter: 0)
    expect(post_object).to respond_to(:show_post_comments)
  end

  it 'Should increase the author post_counter number' do
    post_object = Post.new(title: 'Microverse School', author_id: @author_object.id, text: 'My school',
                           comments_counter: 0, likes_counter: 0)
    expect { post_object.save }.to change { @author_object.reload.posts_counter }.by(1)
  end

  it 'Should show the 5 comments' do
    author_object = User.create(name: 'Graciano Henrique', posts_counter: 0)
    post_object = Post.new(title: 'Microverse School', author_id: author_object.id, text: 'Remote School',
                           comments_counter: 0, likes_counter: 0)
    post_object.save

    comment_texts = ['I want to study HTML & CSS', 'I want to study JS', 'I want to study REACT',
                     'I want to study Ruby', 'I want to study Ruby on Rails']
    comment_texts.map do |text|
      Comment.create(user_id: author_object.id, post_id: post_object.id, text:)
    end

    comments = post_object.show_post_comments(post_object)
    expect(comments.count).to eq(5)
  end
end
