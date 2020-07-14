class Comment < ApplicationRecord
  belongs_to :author,
             class_name: :User,
             foreign_key: :user_id,
             primary_key: :id
  belongs_to :artwork
end