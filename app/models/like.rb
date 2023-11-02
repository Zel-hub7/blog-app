class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_likes_counter

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_likes_counter
    post.increment!(:likes_counter)
  end
end
