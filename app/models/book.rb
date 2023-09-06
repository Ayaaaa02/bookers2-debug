class Book < ApplicationRecord
  
    has_one_attached :image
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :book_comments, dependent: :destroy
  
  
  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
