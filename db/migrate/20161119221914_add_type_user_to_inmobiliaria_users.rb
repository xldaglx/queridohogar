class AddTypeUserToInmobiliariaUsers < ActiveRecord::Migration
  def change
    add_column :inmobiliaria_users, :type_user, :string
  end
end
