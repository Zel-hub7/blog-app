class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :Comment do |t|
      t.integer :UserId
      t.integer :PostId
      t.text :Text
      t.timestamps
    end
  end
end
