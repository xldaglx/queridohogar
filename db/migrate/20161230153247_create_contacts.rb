class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :subject
      t.string :body
      t.string :email
      t.string :phone
      t.integer :is_read
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
