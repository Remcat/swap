class User < ActiveRecord::Base
	has_many :group_members, :dependent => :destroy
	has_many :groups, :through => :group_members
  has_many :owned_groups, foreign_key: :owner_id, class_name: Group

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
