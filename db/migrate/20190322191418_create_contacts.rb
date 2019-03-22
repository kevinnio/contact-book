class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :telephone

      t.timestamps
    end
  end
end
