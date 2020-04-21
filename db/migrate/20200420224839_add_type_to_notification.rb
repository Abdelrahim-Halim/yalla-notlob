class AddTypeToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :notificationType, :string
  end
end
