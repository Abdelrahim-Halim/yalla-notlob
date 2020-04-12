class AddUserToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_reference :friendships , :friend_a, foreign_key: { to_table: :users} 
    add_reference :friendships , :friend_b, foreign_key: { to_table: :users} 
  end
end
