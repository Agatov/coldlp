class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :url
      t.string :phone
      t.string :email
      t.integer :status, default: 0
      t.string :code

      t.timestamps null: false
    end
  end
end
