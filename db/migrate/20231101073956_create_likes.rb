class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :Like do |t|
      t.integer :UserId
      t.integer :PostId
      t.timestamps
    end
  end
end
