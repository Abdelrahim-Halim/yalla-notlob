class CreateGroupFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :group_friends do |t|

      t.timestamps
    end
  end
end
