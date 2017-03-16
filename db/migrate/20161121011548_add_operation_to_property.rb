class AddOperationToProperty < ActiveRecord::Migration
  def change
    add_reference :properties, :operation, index: true, foreign_key: true
  end
end
