class CreatePropertyImages < ActiveRecord::Migration
  def change
    create_table :property_images do |t|
      t.integer :property_id
      t.string :image
      t.integer :position

      t.timestamps null: false
    end
  end
end
