class Public::PostReviewsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    review = current_member.post_reviews.new(post_reviews_params)
    review.post_image_id = post_image.id
    review.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostReview.find_by(id: params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  private

  def post_reviews_params
    params.require(:post_review).permit(:review)
  end
end
