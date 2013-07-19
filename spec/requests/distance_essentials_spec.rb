require 'spec_helper'

describe "DistanceEssentials" do
  describe "GET /distance_essentials" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get distance_essentials_path
      response.status.should be(200)
    end
  end
end
