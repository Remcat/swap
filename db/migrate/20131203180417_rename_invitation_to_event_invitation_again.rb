class RenameInvitationToEventInvitationAgain < ActiveRecord::Migration
  def change
  	rename_table :invitations, :event_invitation
  end
end
