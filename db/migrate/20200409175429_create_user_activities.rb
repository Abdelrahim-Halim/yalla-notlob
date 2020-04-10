class CreateUserActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_activities do |t|

      t.timestamps
    end
  end
end
