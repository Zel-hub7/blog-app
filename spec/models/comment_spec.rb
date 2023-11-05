require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @author_object = User.create(name: 'Ariel_CEO', posts_counter: 0)
    @user_object = User.create(name: 'Graciano Manuel Henrique', posts_counter: 0)
    @post_object = Post.create(title: 'Microverse School', author_id: @author_object.id, comments_counter: 0,
                               likes_counter: 0)
  end

  it 'Should increase the comments counter number in post table' do
    comment_object = Comment.new(user_id: @user_object.id, post_id: @post_object.id,
                                 text: 'I am studying the Backend in Microverse')
    expect { comment_object.save }.to change { @post_object.reload.comments_counter }.by(1)
  end

  it 'Should be a valid comment object' do
    comment_object = Comment.new(user_id: @author_object.id, post_id: @post_object.id,
                                 text: 'I will add a new Module after Job Searching Module')
    expect(comment_object).to be_valid
  end

  it 'Should be an invalid comment object' do
    comment_object = Comment.new
    expect(comment_object).to be_invalid
  end
end
