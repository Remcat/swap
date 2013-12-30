class EventInvitation < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :owner, class_name: User, foreign_key: :invite_sent_by

  def lookup_emails(emails)
    emails.each do |email|
      if Users.where(email: :email)
        #send the event_invitation
      else
        #send the devise/website invitation
      end
    end
  end

  def self.split_addresses(invitees)
    addresses = invitees.split(/\s*[,;]\s* # comma or semicolon, optionally surrounded by whitespace
      | \s{1,}      # two or more whitespace characters
      | [\r\n]+     # any number of newline characters
      /x) unless invitees.nil?
  end
end
