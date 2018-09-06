require "rails_helper"

RSpec.describe PhotographersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/photographers").to route_to("photographers#index")
    end


    it "routes to #show" do
      expect(:get => "/photographers/1").to route_to("photographers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/photographers").to route_to("photographers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/photographers/1").to route_to("photographers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/photographers/1").to route_to("photographers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/photographers/1").to route_to("photographers#destroy", :id => "1")
    end

  end
end
