class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :customers_id
      t.string :address
      t.string :post_code
      t.string :name
      t.timestamps
    end
  end
end
