class AddInviteSentByAndInviteSentToToUsersEventInvitations < ActiveRecord::Migration
  def change
    add_column :users_event_invitations, :invite_sent_by, :integer
    add_column :users_event_invitations, :invite_sent_to, :integer
  end
end
