class CreateInvitedUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :invited_users do |t|
      t.string :status

      t.timestamps
    end
  end
end
