class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password

      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :users, :email
  end

  def down
    drop_table :users
  end
end

