class AddColumnsToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :seen, :boolean
    add_column :notifications, :img, :string
  end
end
