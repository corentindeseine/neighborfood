class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :ordered_quantity
      t.references :orders, null: false, foreign_key: true
      t.references :meals, null: false, foreign_key: true

      t.timestamps
    end
  end
end
