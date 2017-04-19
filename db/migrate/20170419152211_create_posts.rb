class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :image, null: false
      t.integer :likes, :shares, :inappropriate_reports
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
