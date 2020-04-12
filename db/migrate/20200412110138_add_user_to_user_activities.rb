class AddUserToUserActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_activities, :user, null: false, foreign_key: true
  end
end
