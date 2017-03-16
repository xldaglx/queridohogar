class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :description
      t.timestamps null: false
    end
  end
end
