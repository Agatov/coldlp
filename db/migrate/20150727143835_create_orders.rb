class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :contact_id
      t.string :email

      t.timestamps null: false
    end
  end
end
