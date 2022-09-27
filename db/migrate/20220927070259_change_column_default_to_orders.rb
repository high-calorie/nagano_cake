class ChangeColumnDefaultToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :postage, from: nil, to: "800"
    change_column_default :orders, :order_status, from: nil, to: "0"
  end
end
