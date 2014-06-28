class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :nombre
      t.string :usuario
      t.string :password
      t.string :email
      t.string :direccion
      t.string :telefono
      t.integer :meta
      t.boolean :gerente
      t.boolean :vendedor

      t.timestamps
    end
  end
end
