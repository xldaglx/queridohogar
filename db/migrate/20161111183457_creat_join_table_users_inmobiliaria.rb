class CreatJoinTableUsersInmobiliaria < ActiveRecord::Migration
  def change
    create_join_table :users, :inmobiliaria do |t|
      # t.index [:user_id, :inmobiliarium_id]
      # t.index [:inmobiliarium_id, :user_id]
    end
  end
end
