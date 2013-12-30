class AddIdColumnToUsersEventInvitation < ActiveRecord::Migration
  def change
    add_column :users_event_invitations, :id, :integer
  end
end
