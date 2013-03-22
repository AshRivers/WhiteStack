class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :picture
      t.string :cell_phone
      t.text :adress
      t.text :additional_info

      t.timestamps
    end
  end
end
