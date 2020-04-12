class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :title
      t.integer :quantity
      t.decimal :price
      t.text :comment

      t.timestamps
    end
  end
end
