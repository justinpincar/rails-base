class CreateAuthorizations < ActiveRecord::Migration
  def up
    create_table "authorizations", :force => true do |t|
      t.integer  "user_id"
      t.string   "role"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "authorizations", "user_id"
  end

  def down
    remove_index :authorizations, :user_id
    drop_table :authorizations
  end
end

