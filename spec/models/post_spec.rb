require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  subject do
    Post.new(title: 'Title', text: 'Sample', commentsCounter: 2, likesCounter: 1, author: user)
  end
  before { subject.save }
  it ' Title must not be blank.' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters.' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end
  it 'commentsCounter must be integer and greater than or equal to 0.' do
    subject.commentsCounter = 'aa'
    expect(subject).to_not be_valid
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end
  it 'likesCounter must be integer and greater than or equal to 0.' do
    subject.commentsCounter = 'aa'
    expect(subject).to_not be_valid
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end

  it "increments the user's posts_counter by 1" do
    user = create(:user)
    post = build(:post, author: user)

    expect { post.save }.to change { user.reload.posts_counter }.by(1)
  end

  it 'should display last 5 recent comments' do
    post = create(:post, author: user)

    create(:comment, post:, created_at: 1.hour.ago)
    create(:comment, post:, created_at: 1.hour.ago)
    create(:comment, post:, created_at: 1.hour.ago)
    create(:comment, post:, created_at: 1.hour.ago)
    create(:comment, post:, created_at: 1.hour.ago)
    recent_comments = post.recent_comments

    expect(recent_comments.count).to eq(5)
  end
end
