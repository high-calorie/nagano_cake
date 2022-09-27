class RenameCustomersIdColumnToCustomerId < ActiveRecord::Migration[6.1]
  def change
    rename_column :deliveries, :customers_id, :customer_id
  end
end
