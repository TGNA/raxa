class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table(:product_categories, :id => false) do |t|
      t.string :name
      t.integer :s_id, :options => 'PRIMARY KEY'
    end
  end
end
