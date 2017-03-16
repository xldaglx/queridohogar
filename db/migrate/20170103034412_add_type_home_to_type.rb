class AddTypeHomeToType < ActiveRecord::Migration
  def change
    add_column :types, :type_home, :string
  end
end
