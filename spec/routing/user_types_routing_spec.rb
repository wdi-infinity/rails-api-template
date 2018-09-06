require "rails_helper"

RSpec.describe UserTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_types").to route_to("user_types#index")
    end


    it "routes to #show" do
      expect(:get => "/user_types/1").to route_to("user_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_types").to route_to("user_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_types/1").to route_to("user_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_types/1").to route_to("user_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_types/1").to route_to("user_types#destroy", :id => "1")
    end

  end
end
