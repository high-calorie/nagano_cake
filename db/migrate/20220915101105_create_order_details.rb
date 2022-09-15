class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :tax_included_price
      t.integer :quantity
      t.integer :make_status
      t.timestamps
    end
  end
end
