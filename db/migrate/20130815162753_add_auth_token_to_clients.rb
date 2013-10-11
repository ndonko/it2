class AddAuthTokenToClients < ActiveRecord::Migration
  def change
    add_column :clients, :auth_token, :string
  end
end
