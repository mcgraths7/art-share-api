# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, uniqueness: true
  has_many :artworks,
           class_name: :Artwork,
           foreign_key: :artist_id,
           primary_key: :id,
           dependent: :destroy
  has_many :artwork_shares,
           class_name: :ArtworkShare,
           foreign_key: :viewer_id,
           primary_key: :id,
           dependent: :destroy
  has_many :shared_artworks,
           class_name: :Artwork,
           foreign_key: :artwork_id,
           primary_key: :artwork_id,
           through: :artwork_shares,
           source: :artwork
  has_many :comments,
           dependent: :destroy
  has_many :likes
  has_many :liked_artworks, 
           through: :likes,
           source: :likeable,
           source_type: 'Artwork'
  has_many :liked_comments,
           through: :likes,
           source: :likeable,
           source_type: 'Comment'
end
