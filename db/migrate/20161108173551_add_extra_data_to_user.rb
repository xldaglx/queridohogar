class AddExtraDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :birth_date, :string
    add_column :users, :gender, :char
  end
end
