class Public::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

   # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.member_id = current_member.id
    @post_image.save!
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
      @all_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_review = PostReview.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
   # 投稿データのストロングパラメータ
  private
  def post_image_params
    params.require(:post_image).permit(:game_name, :image, :caption)
  end
end
