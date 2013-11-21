class Group < ActiveRecord::Base 
	has_many :group_members, :dependent => :destroy
	has_many :users, :through => :group_members
	belongs_to  :owner, class_name: User, foreign_key: :owner_id
end
