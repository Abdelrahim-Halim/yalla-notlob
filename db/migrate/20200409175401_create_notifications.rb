class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :content
      t.string :action_url

      t.timestamps
    end
  end
end
