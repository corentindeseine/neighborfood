class AddColumnCookerIdToOrders < ActiveRecord::Migration[6.1]
  def change
    change_table(:orders) do |t|
        t.references :cooker, foreign_key: { to_table: 'users'}
    end
  end
end
