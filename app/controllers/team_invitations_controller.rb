class TeamInvitationsController < ApplicationController
  load_and_authorize_resource
  # GET /team_invitations
  # GET /team_invitations.json
  def index
    #@team_invitations = TeamInvitation.current_user
    @team_invitations = TeamInvitation.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team_invitations }
    end
  end

  # GET /team_invitations/1
  # GET /team_invitations/1.json
  def show
    @team_invitation = TeamInvitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team_invitation }
    end
  end

  # GET /team_invitations/new
  # GET /team_invitations/new.json
  def new
    @team_invitation = TeamInvitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team_invitation }
    end
  end

  # GET /team_invitations/1/edit
  def edit
    @team_invitation = TeamInvitation.find(params[:id])
  end

  # POST /team_invitations
  # POST /team_invitations.json
  def create
    @team_invitation = TeamInvitation.new(params[:team_invitation])

    respond_to do |format|
      if @team_invitation.save
        format.html { redirect_to @team_invitation, notice: 'Team invitation was successfully created.' }
        format.json { render json: @team_invitation, status: :created, location: @team_invitation }
      else
        format.html { render action: "new" }
        format.json { render json: @team_invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /team_invitations/1
  # PUT /team_invitations/1.json
  def update
    @team_invitation = TeamInvitation.find(params[:id])

    respond_to do |format|
      if @team_invitation.update_attributes(params[:team_invitation])
        format.html { redirect_to @team_invitation, notice: 'Team invitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team_invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_invitations/1
  # DELETE /team_invitations/1.json
  def destroy
    @team_invitation = TeamInvitation.find(params[:id])
    @team_invitation.destroy

    respond_to do |format|
      format.html { redirect_to team_invitations_url }
      format.json { head :no_content }
    end
  end
end
