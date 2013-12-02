class SwapMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite(receiver)
    mail :subject => "You've been invited to join a Babysitting Co-Op!",
         :to      => receiver,
         :from    => "invitation@yourdomain.com"
  end

  def email_name
    mail :subject => "Generic email!",
         :to      => "ramy.abdelazim@gmail.com",
         :from    => "invitation@yourdomain.com"
  end
end