class AddTypeToProperty < ActiveRecord::Migration
  def change
    add_reference :properties, :type, index: true, foreign_key: true
  end
end
