class Admin::HomesController < ApplicationController
  # 管理者home controller
  def top
     @post_images = PostImage.all.page(params[:page]).per(5).order(created_at: :desc)
  end
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admin_root_path
  end
end
