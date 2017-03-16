class CreatePropertyAdditionals < ActiveRecord::Migration
  def change
    create_table :property_additionals do |t|
      t.references :additional, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
