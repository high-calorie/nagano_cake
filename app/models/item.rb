class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :genre
  has_many :cart_items

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def add_tax_net_price
   (self.net_price * 1.10).round
  end

end
