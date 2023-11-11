# app/models/user.rb

class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true

  after_save :update_posts_counter

  def user_recent_posts
    posts.order('created_at DESC').limit(3)
  end

  private

  def update_posts_counter
    update(posts_counter: posts&.count.to_i)
  end
end
