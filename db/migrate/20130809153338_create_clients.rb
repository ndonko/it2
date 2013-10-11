class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :entreprise
      t.string :telephone

      t.timestamps
    end
  end
end
