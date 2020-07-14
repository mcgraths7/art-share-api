class CorrectLikesReferences < ActiveRecord::Migration[5.2]
  def change
    remove_reference :likes, :likeable
  end
end
