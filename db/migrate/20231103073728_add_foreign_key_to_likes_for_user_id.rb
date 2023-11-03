class AddForeignKeyToLikesForUserId < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :likes, :users, column: :user_id
  end
end
