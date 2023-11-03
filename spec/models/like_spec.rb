require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @author_object = User.create(name: 'Ariel_CEO', posts_counter: 0)
    @post_object = Post.create(title: 'Microverse School', author_id: @author_object.id, comments_counter: 0, likes_counter: 0)
  end

  it 'Should increase the likes counter number in post table' do
    like_object = Like.new(user_id: @author_object.id, post_id: @post_object.id)
    expect { like_object.save }.to change { @post_object.reload.likes_counter }.by(1)
  end

  it 'Should be a valid like object' do
    like_object = Like.new(user_id: @author_object.id, post_id: @post_object.id)
    expect(like_object).to be_valid
  end

  it 'Should be an invalid like object' do
    like_object = Like.new
    expect(like_object).to be_invalid
  end
end
