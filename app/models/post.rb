class Post < ApplicationRecord
    belongs_to :user, foreign_key: 'author_id', class_name: 'User'
    has_many :comments, foreign_key: 'post_id'
    has_many :likes, foreign_key: 'post_id'

    after_create :update_user_posts_counter

    private
  
    def update_user_posts_counter
      user.increment!(:posts_counter)
    end
    
end
