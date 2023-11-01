class DropTables < ActiveRecord::Migration[7.1]
  def up
    drop_table :usersss
    drop_table :users
    drop_table :Post
    drop_table :Like
    drop_table :Comment
    drop_table :User
  end
end
