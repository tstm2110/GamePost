class PostImage < ApplicationRecord
   belongs_to :member
   attachment :image
   has_many :post_reviews, dependent: :destroy
   has_many :favorites, dependent: :destroy

   has_many :tag_maps, dependent: :destroy
   has_many :tags, through: :tag_maps

  def favorited_by?(member)

    self.favorites.where(member_id: member.id).exists?
  end

  def self.search(search,word)
    if search == "forward_match"
        @game = PostImage.where("game_name LIKE?","#{word}%")
    elsif search == "backward_match"
        @game = PostImage.where("game_name LIKE?","%#{word}")
    elsif search == "perfect_match"
        @game = PostImage.where("#{word}")
    elsif search == "partial_match"
        @game = PostImage.where("game_name LIKE?","%#{word}%")
    else
        @game = PostImage.all
    end
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      p new_post_tag
      self.tags << new_post_tag
    end
  end
end
