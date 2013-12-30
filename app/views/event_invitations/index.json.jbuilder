json.array!(@event_invitations) do |event_invitation|
  json.extract! event_invitation, 
  json.url event_invitation_url(event_invitation, format: :json)
end
