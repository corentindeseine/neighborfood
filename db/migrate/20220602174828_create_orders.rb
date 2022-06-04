class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :delivery_date_time
      t.integer :status
      t.references :client, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
