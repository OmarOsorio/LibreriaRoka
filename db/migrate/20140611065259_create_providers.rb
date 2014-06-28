class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :nombre
      t.string :telefono
      t.string :email
      t.string :direccion
      t.string :tipo_libro

      t.timestamps
    end
  end
end
