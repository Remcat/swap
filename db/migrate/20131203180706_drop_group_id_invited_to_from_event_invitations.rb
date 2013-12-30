class DropGroupIdInvitedToFromEventInvitations < ActiveRecord::Migration
  def change
  	remove_column :event_invitations, :group_id_invited_to
  end
end
