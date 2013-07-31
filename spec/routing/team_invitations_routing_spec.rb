require "spec_helper"

describe TeamInvitationsController do
  describe "routing" do

    it "routes to #index" do
      get("/team_invitations").should route_to("team_invitations#index")
    end

    it "routes to #new" do
      get("/team_invitations/new").should route_to("team_invitations#new")
    end

    it "routes to #show" do
      get("/team_invitations/1").should route_to("team_invitations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/team_invitations/1/edit").should route_to("team_invitations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/team_invitations").should route_to("team_invitations#create")
    end

    it "routes to #update" do
      put("/team_invitations/1").should route_to("team_invitations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/team_invitations/1").should route_to("team_invitations#destroy", :id => "1")
    end

  end
end
