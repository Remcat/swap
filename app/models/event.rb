class Event < ActiveRecord::Base
	scope :between, lambda {|start_time, end_time| {:conditions => ["? < starts_at < ?", Event.format_date(start_time),      Event.format_date(end_time)] } }  
  belongs_to  :sitter, class_name: User, foreign_key: :sitter_id
  belongs_to  :owner, class_name: User, foreign_key: :owner_id
  belongs_to  :group, class_name: Group, foreign_key: :group_id
  has_many :users_event_invitations
  has_many :users, through: :users_event_invitations

  def invite!(user)
    UsersEventInvitation.create(invite_sent_by: self.owner.id, invite_sent_to: user.id, event_id: self.id)
  end

  def lookup_and_send_emails(emails, msg)
    addresses = split_addresses(emails)
    not_subscribed = []
    addresses.each do |email|
      user = User.find_by_email(email)
      if user
        invite!( user)
        SwapMailer.babysitter_request(email, msg).deliver
      else
        not_subscribed << email
      end
    end
    not_subscribed
  end

  def split_addresses(invitees)
    addresses = invitees.split(/\s*[,;]\s* # comma or semicolon, optionally surrounded by whitespace
      | \s{1,}      # two or more whitespace characters
      | [\r\n]+     # any number of newline characters
      /x) unless invitees.nil?
  end

  def self.format_date(date_time)  
   Time.at(date_time.to_i).to_formatted_s(:db)  
  end 

  def as_json(options = {})  
    {  
      :id => self.id,  
      :title => self.title,  
      :description => self.description || "",  
      :start => start_at.rfc822,  
      :end => end_at.rfc822,  
      :allDay => self.all_day,  
      :recurring => false,  
      :url => Rails.application.routes.url_helpers.event_path(id),  
    }  
  end  

  #has_event_calendar
end
