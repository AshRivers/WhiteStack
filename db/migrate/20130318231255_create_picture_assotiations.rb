class CreatePictureAssotiations < ActiveRecord::Migration
  def change
    create_table :picture_assotiations do |t|
      t.integer :picture_id
      t.integer :product_id

      t.timestamps
    end
  end
end
