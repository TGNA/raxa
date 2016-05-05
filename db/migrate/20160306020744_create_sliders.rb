class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :picture
      t.string :title
      t.text :description
      t.string :color
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
