class DeviseUsers::InvitationsController < Devise::InvitationsController
	def invite_user
    # new user
    if User.find_by_email(invite_params[:email]).nil?
      super
    # existing user
    else
      @u = User.find_by_email!(invite_params[:email])
    		#....more code that does what you want....
    end
  end
end
