class Book < ApplicationRecord
  
    has_one_attached :image
    belongs_to :user
  
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
