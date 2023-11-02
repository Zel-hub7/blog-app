require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom') }
  let(:user) { subject }

  it 'Name must not be blank.' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  describe 'Recent Posts' do
    before do
      5.times do
        Post.create(author_id: subject.id, title: 'Hello', text: 'Test Post')
      end
    end
    it 'should display last 3 posts' do
      expect(subject.recent_posts).to eq subject.posts.order(created_at: :desc).limit(3)
    end
  end
end
