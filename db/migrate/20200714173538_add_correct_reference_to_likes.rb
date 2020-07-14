class AddCorrectReferenceToLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :likeable_type
    add_reference :likes, :likeable, polymorphic: true, index: true
  end
end
