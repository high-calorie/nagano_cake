class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  def get_image
    if image.attached?
      image
    end
  end
end
