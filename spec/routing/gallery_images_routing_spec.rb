require "rails_helper"

RSpec.describe AlbumImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/album_images").to route_to("album_images#index")
    end


    it "routes to #show" do
      expect(:get => "/album_images/1").to route_to("album_images#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/album_images").to route_to("album_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/album_images/1").to route_to("album_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/album_images/1").to route_to("album_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/album_images/1").to route_to("album_images#destroy", :id => "1")
    end

  end
end
