class AddGroupToGroupFriends < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_friends, :group, null: false, foreign_key: true
  end
end
