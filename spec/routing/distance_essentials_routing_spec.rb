require "spec_helper"

describe DistanceEssentialsController do
  describe "routing" do

    it "routes to #index" do
      get("/distance_essentials").should route_to("distance_essentials#index")
    end

    it "routes to #new" do
      get("/distance_essentials/new").should route_to("distance_essentials#new")
    end

    it "routes to #show" do
      get("/distance_essentials/1").should route_to("distance_essentials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/distance_essentials/1/edit").should route_to("distance_essentials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/distance_essentials").should route_to("distance_essentials#create")
    end

    it "routes to #update" do
      put("/distance_essentials/1").should route_to("distance_essentials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/distance_essentials/1").should route_to("distance_essentials#destroy", :id => "1")
    end

  end
end
