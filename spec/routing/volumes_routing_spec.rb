require "rails_helper"

RSpec.describe VolumesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/").to route_to("volumes#index")
    end

    it "routes to search" do
      expect(:get => "volumes/search").to route_to("volumes#search")
    end 

  end
end
