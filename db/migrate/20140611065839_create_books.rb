class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :titulo
      t.string :autor
      t.string :editorial
      t.decimal :precio
      t.integer :existencias

      t.timestamps
    end
  end
end
