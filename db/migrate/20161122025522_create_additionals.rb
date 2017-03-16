class CreateAdditionals < ActiveRecord::Migration
  def change
    create_table :additionals do |t|
      t.string :description
      t.string :image
      t.string :category

      t.timestamps null: false
    end
  end
end
