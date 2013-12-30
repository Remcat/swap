class CreateUsersEventInvitations < ActiveRecord::Migration
  def change
    create_table :users_event_invitations do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
