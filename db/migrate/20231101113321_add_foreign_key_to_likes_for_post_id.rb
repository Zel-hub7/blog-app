class AddForeignKeyToLikesForPostId < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :likes, :posts, column: :post_id
  end
end
