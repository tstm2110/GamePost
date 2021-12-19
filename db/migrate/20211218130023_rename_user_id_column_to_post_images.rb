class RenameUserIdColumnToPostImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_images, :user_id, :member_id
  end
end
