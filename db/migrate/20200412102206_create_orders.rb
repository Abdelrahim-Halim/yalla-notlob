class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :resturant
      t.string :menu
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
