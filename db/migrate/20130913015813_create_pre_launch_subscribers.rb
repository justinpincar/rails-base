class CreatePreLaunchSubscribers < ActiveRecord::Migration
  def up
    create_table :pre_launch_subscribers do |t|
      t.string :email
      t.timestamps
    end
  end

  def down
    drop_table :pre_launch_subscribers
  end
end

