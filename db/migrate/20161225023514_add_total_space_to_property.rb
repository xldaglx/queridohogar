class AddTotalSpaceToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :totalm, :integer
  end
end
