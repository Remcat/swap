class RenameInvitationToEventInvitation < ActiveRecord::Migration
  def change
  	rename_table :invitation, :event_invitation
  end
end
