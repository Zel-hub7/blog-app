class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :User do |t|
      t.string :Name
      t.string :Photo
      t.text :Bio
      t.integer :PostsCounter
      t.timestamps
    end
  end
end
