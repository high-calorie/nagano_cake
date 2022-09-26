class CartItem < ApplicationRecord

    belongs_to :customer
    belongs_to :item
    has_one_attached :image
    validates :quantity, presence: true

    def subtotal
        item.add_tax_net_price * quantity
    end

    def sum_of_price
        item.net_price * quantity
    end

end
