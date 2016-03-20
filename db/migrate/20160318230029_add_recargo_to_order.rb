class AddRecargoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :recargo, :decimal, precision: 12, scale: 3
  end
end
