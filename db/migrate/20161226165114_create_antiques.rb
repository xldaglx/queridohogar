class CreateAntiques < ActiveRecord::Migration
  def change
    create_table :antiques do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
