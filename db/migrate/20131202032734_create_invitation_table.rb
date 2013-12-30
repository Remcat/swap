class CreateInvitationTable < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :invite_sent_by
      t.integer :invite_sent_to
      t.integer :group_id_invited_to
      t.string :invitation_token
      t.datetime :invitation_created_at
      t.datetime :invitation_sent_at
      t.datetime :invitation_accepted_at
      t.integer :invitation_limit
      t.integer :invited_by_id
      t.string :invited_by_type
    end
  end
end
