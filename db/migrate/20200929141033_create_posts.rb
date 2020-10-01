class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.string :post_image_id
      t.string :tag_list

      t.timestamps
    end
  end
end
