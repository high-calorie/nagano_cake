class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    def subtotal_price
        item.add_tax_net_price * quantity
    end  
end
