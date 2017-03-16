class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.decimal :price, precision: 9, scale: 2
      t.string :currency
      t.string :description
      t.string :state
      t.string :city
      t.string :colony
      t.integer :cp
      t.decimal :lat, precision: 9, scale: 7
      t.decimal :lng, precision: 9, scale: 7
      t.string :address_google
      t.string :antique
      t.date :available
      t.integer :park
      t.decimal :bathdroom, precision: 2, scale: 2
      t.integer :rooms
      t.decimal :m2, precision: 9, scale: 2

      t.timestamps null: false
    end
  end
end
