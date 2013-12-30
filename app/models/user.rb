class User < ActiveRecord::Base
	has_many :group_members, :dependent => :destroy
	has_many :groups, :through => :group_members
  has_many :owned_groups, foreign_key: :owner_id, class_name: Group
  has_and_belongs_to_many :event_invitations
  has_many :user_event_invitations
  has_many :events, through: :user_event_invitations

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
end
