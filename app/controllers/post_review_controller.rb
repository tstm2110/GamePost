class PostReviewController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
    review = current_user.post_review.new(post_review_params)
    review.post_image_id = post_image.id
    review.save
    redirect_to post_image_path(post_image)
  end

  def destroy
  end
    private

  def post_review_params
    params.require(:post_review).permit(:review)
  end
end
