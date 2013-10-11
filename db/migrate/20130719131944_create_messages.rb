class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :nom
      t.string :prenom
      t.string :entreprise
      t.string :lieu
      t.string :telephone
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
