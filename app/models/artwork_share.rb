# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer
#  viewer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'byebug'
class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validate :same_user_cant_have_same_artwork_shared_twice
  validate :cant_share_artwork_with_artist


  belongs_to :viewer,
             class_name: :User,
             foreign_key: :viewer_id,
             primary_key: :id
  belongs_to :artwork

  def same_user_cant_have_same_artwork_shared_twice
    existing_artwork_share = ArtworkShare.find_by(viewer_id: self[:viewer_id], artwork_id: self[:artwork_id])
    if existing_artwork_share
      errors[:viewer] << 'cannot have the same artwork shared with them twice'
    end
  end

  def cant_share_artwork_with_artist
    artist = artwork.artist
    if artist[:id] == self[:viewer_id]
      errors[:artwork] << 'cannot be shared with the artist'
    end
  end

end
