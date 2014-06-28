class CreateDetailOrders < ActiveRecord::Migration
  def change
    create_table :detail_orders do |t|
      t.integer :order_id
      t.integer :book_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
