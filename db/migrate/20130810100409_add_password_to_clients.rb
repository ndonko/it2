class AddPasswordToClients < ActiveRecord::Migration
  def change
    add_column :clients, :encrypted_password, :string
  end
end
