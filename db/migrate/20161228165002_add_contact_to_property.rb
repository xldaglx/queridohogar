class AddContactToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :phone, :string
    add_column :properties, :phone2, :string
    add_column :properties, :email, :string
  end
end
