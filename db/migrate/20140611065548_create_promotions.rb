class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :client_id
      t.integer :employee_id
      t.date :fecha
      t.string :medioComunicacion
      t.text :acuerdo

      t.timestamps
    end
  end
end
