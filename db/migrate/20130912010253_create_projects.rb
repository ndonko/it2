class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.string :question1
      t.string :question2

      t.timestamps
   end
 
  add_index :projects, :client_id
 end
end
