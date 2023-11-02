require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  subject { Comment.new(user:, post:, text: 'Sample Comment') }

  before { subject.save }

  it 'updates the post commentsCounter when a comment is created' do
    expect do
      comment = Comment.create(user:, post:, text: 'Sample Comment 2')
      comment.save
    end.to change { post.reload.commentsCounter }.by(1)
  end
end
