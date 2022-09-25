class CartItem < ApplicationRecord

    belongs_to :customer
    belongs_to :order
    belongs_to :item
    has_one_attached :image

    def subtotal
        item.add_tax_net_price * quantity
    end

end
