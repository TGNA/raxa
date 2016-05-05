class CreateNewClients < ActiveRecord::Migration
  def change
    create_table :new_clients do |t|
      t.string :name 
      t.string :email
      t.string :mobile
      t.string :subject
      t.string :company
      t.string :dni
    end
  end
end
