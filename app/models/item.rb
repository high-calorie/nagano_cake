class Item < ApplicationRecord

     
     has_one_attached :image
  belongs_to :genre
  
  def get_image
    if image.attached?
      image
    end
  end
    
  def add_tax_net_price
   (self.net_price * 1.10).round
  end    
    
    

end
