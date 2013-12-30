class UsersEventInvitation < ActiveRecord::Base
  belongs_to :users, :foreign_key => :invite_sent_by
  belongs_to :users, :foreign_key => :invite_sent_to
end
