class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :cooker, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
