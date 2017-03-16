class AddMembershipToUser < ActiveRecord::Migration
  def change
    add_reference :users, :membership, index: true, foreign_key: true
  end
end
