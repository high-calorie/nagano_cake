class Delivery < ApplicationRecord
  belongs_to :customer, dependent: :destroy
end
