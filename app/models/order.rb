class Order < ApplicationRecord
   enum payment_method: { credit_card: 0, transfer: 1 }
    enum order_status: { wait: 0, confirm: 1, making:2, prepare:3, finish:4 }

    belongs_to :customer
    has_many :order_details
end
