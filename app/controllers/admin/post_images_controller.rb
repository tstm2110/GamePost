class Admin::PostImagesController < ApplicationController
   # 管理者 postimages controller
    def show
    @post_image = PostImage.find(params[:id])
    @post_review = PostReview.new

    @post = PostImage.find(params[:id])  #クリックした投稿を取得。
    @post_tags = @post.tags         #そのクリックした投稿に紐付けられているタグの取得。
    end
end
