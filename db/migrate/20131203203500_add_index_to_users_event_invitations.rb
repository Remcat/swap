class AddIndexToUsersEventInvitations < ActiveRecord::Migration
  def change
	add_index(:users_event_invitations, [:user_id, :event_invitation_id], :unique => true, :name => 'user_event'), primary_key: true
  end
end
