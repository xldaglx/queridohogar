class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url_path
      t.integer :order

      t.timestamps null: false
    end
  end
end
