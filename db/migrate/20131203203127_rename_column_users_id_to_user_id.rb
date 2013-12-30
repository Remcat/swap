class RenameColumnUsersIdToUserId < ActiveRecord::Migration
  def change
  	rename_column :users_event_invitations, :users_id, :user_id
  end
end
