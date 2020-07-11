# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string
#  artist_id  :bigint
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :artist_id, presence:true
  validate :not_same_title_per_artist

  belongs_to :artist, 
             class_name: :User,
             foreign_key: :artist_id,
             primary_key: :id
  has_many :artwork_shares,
           class_name: :ArtworkShare,
           foreign_key: :artwork_id,
           primary_key: :id,
           dependent: :destroy
  has_many :shared_viewers,
           class_name: :User,
           foreign_key: :viewer_id,
           primary_key: :id,
           through: :artwork_shares,
           source: :viewer

  def not_same_title_per_artist
    art_title = Artwork.find_by(title: self[:title], artist_id: self[:artist_id])
    if art_title
      errors[:title] << 'must be unique (for each user)'
    end
  end
end
