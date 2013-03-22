class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.text :address
      t.string :cell_phone
      t.text :additional_info

      t.timestamps
    end
  end
end
