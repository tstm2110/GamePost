class CreatePostReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :post_reviews do |t|
      t.text :review
      t.integer :user_id
      t.integer :post_image_id

      t.timestamps
    end
  end
end
