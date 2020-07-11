class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, foreign_key: true
      t.integer :viewer_id, foreign_key: true
      t.timestamps
    end
  end
end
