class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :telefono
      t.string :email
      t.string :direccion
      t.string :rfc
      t.string :facebook
      t.string :linkedln

      t.timestamps
    end
  end
end
