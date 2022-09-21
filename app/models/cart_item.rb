class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :item
  belongs_to :customer
  
  def subtotal
    item.add_tax_net_price*quantity
  end
end
