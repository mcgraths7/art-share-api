class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, index: true
      t.integer :user_id, null: false
      t.string :image_url, null: false
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
