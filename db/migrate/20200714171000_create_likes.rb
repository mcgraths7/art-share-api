class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :artwork_id
      t.integer :comment_id
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
