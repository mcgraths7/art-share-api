# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  artwork_id :integer
#  body       :string
#
class Comment < ApplicationRecord
  include Likeable
  belongs_to :author,
             class_name: :User,
             foreign_key: :user_id,
             primary_key: :id
  belongs_to :artwork
  has_many :likes, as: :likeable,
           dependent: :destroy
end
