class RenameEventInvitationToEventInvitations < ActiveRecord::Migration
  def change
  	rename_table :event_invitation, :event_invitations
  end
end