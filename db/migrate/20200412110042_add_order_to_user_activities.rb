class AddOrderToUserActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_activities, :order, null: false, foreign_key: true
  end
end
