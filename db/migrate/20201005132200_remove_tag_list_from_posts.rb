class RemoveTagListFromPosts < ActiveRecord::Migration[5.2]

  def up
  	remove_column :posts, :tag_list
  end

  def down
    remove_column :posts, :tag_list, :string
  end
end
