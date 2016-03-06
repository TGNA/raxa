class AddFieldsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :email, :string
    add_column :contacts, :mobile, :string
    add_column :contacts, :subject, :text
  end
end
