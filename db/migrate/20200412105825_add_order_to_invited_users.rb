class AddOrderToInvitedUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :invited_users, :order, null: false, foreign_key: true
  end
end
