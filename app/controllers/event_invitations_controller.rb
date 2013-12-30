class EventInvitationsController < ApplicationController
  before_action :set_event_invitation, only: [:show, :edit, :update, :destroy]

  # GET /event_invitations
  # GET /event_invitations.json
  def index
    @event_invitations = EventInvitation.all
  end

  # GET /event_invitations/1
  # GET /event_invitations/1.json
  def show
  end

  # GET /event_invitations/new
  def new
    @event = Event.new
    @event.event_invitations.build
  end

  # GET /event_invitations/1/edit
  def edit
  end

  # POST /event_invitations
  # POST /event_invitations.json
  def create
    msg = event_invitation_params[:email_message]
    emails = EventInvitation.lookup_emails(EventInviation.split_addresses(event_invitation_params[:user_emails]))
    
    @event_invitation = EventInvitation.new(event_invitation_params)

    respond_to do |format|
      if @event_invitation.save
        format.html { redirect_to @event_invitation, notice: 'Event invitation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_invitation }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_invitations/1
  # PATCH/PUT /event_invitations/1.json
  def update
    respond_to do |format|
      if @event_invitation.update(event_invitation_params)
        format.html { redirect_to @event_invitation, notice: 'Event invitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_invitations/1
  # DELETE /event_invitations/1.json
  def destroy
    @event_invitation.destroy
    respond_to do |format|
      format.html { redirect_to event_invitations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_invitation
      @event_invitation = EventInvitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_invitation_params
      params.require(:event_invitation).permit(:invite_sent_by, :invite_sent_to, :user_emails, :email_message)
    end
end
