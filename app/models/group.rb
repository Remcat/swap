class Group < ActiveRecord::Base 
	has_many :group_members, :dependent => :destroy
	has_many :users, :through => :group_members
	belongs_to  :owner, class_name: User, foreign_key: :owner_id

	def self.send_invitations(invitees)
		addresses = invitees.split(/\s*[,;]\s* # comma or semicolon, optionally surrounded by whitespace
      | \s{1,}      # two or more whitespace characters
      | [\r\n]+     # any number of newline characters
      /x) unless invitees.nil?
  end
end
