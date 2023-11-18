# app/models/user.rb

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  after_save :update_posts_counter

  def user_recent_posts
    posts.order('created_at DESC').limit(3)
  end

  private

  def update_posts_counter
    new_counter_value = posts&.count.to_i
    update(posts_counter: new_counter_value) unless posts_counter == new_counter_value
  end
end
