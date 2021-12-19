class Public::HomesController < ApplicationController
  def top
    @all_ranks = PostImage.includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}

    # @all_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))

  end
end
