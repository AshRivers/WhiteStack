class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :estimated_time
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
