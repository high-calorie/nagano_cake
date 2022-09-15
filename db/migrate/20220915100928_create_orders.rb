class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postal_code
      t.string :shipping_address
      t.string :name
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method
      t.integer :order_status
      t.timestamps
    end
  end
end
