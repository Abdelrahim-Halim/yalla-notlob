class AddUserToGroupFriends < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_friends, :user, null: false, foreign_key: true
  end
end
