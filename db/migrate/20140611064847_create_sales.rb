class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :client_id
      t.datetime :fecha_venta

      t.timestamps
    end
  end
end
