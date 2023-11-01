class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :Post do |t|
      t.integer :AuthorId
      t.string :Title
      t.text :Text
      t.integer :CommentsCounter
      t.integer :LikesCounter
      t.timestamps
    end
  end
end
