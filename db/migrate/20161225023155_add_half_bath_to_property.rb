class AddHalfBathToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :halfbath, :integer
  end
end
