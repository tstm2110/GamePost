class PostImage < ApplicationRecord
   belongs_to :member
   attachment :image
   has_many :post_reviews, dependent: :destroy
   has_many :favorites, dependent: :destroy

  def favorited_by?(member)

    self.favorites.where(member_id: member.id).exists?
  end
end
