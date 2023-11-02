class Like < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id' class_name: 'User'
    belongs_to :post, foreign_key: 'post_id' class_name: 'Post'

    after_create :update_post_likes_counter

    private
  
    def update_post_likes_counter
      post.increment!(:likes_counter)
    end
end
