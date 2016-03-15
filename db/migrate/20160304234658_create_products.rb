class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :ref_1
      t.integer :ref_2
      t.string :description
      t.integer :cat_id
      t.decimal :iva
      t.decimal :recargo_eq
      t.decimal :ean
      t.decimal :unidad_caja
      t.string :foto
      t.decimal :tarifa_1
      t.decimal :tarifa_2
      t.decimal :tarifa_3
      t.decimal :tarifa_4
      t.decimal :tarifa_5
      t.boolean :activo
      t.integer :descuento
    end
  end
end
