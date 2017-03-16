class AddStreetToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :street, :string
    add_column :properties, :number, :string
  end
end
