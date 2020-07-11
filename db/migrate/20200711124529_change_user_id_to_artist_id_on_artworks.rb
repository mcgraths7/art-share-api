class ChangeUserIdToArtistIdOnArtworks < ActiveRecord::Migration[5.2]
  def change
    rename_column :artworks, :user_id, :artist_id
  end
end
