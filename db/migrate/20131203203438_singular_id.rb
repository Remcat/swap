class SingularId < ActiveRecord::Migration
  def change
		rename_column :users_event_invitations, :event_invitations_id, :event_invitation_id
  end
end
