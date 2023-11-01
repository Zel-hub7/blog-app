class AddForeignKeyToPosts < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :Post, :User, column: :AuthorId
  end
end
