class AddEmailUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :messages, :email, :unique => true
    add_index :clients,  :email, :unique => true
  end

  def down
    remove_index :messages, :email
    remove_index :clients, :email
  end
end
