class AddMunicipallityToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :neighborhood, :string
  end
end
