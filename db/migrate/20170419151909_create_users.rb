class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname, :username, :email, :password_digest, null: false
      t.integer :followers, :following, array: true, default: []

      t.timestamps
    end
  end
end
