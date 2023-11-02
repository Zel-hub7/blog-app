require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  subject { Like.new(user:, post:) }
  before { subject.save }

  it 'update the likes counter' do
    expect do
      like = Like.create(user:, post:)
      like.save
    end.to change { post.reload.likesCounter }.by(1)
  end
end
