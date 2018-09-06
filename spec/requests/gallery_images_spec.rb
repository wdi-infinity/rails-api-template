require 'rails_helper'

RSpec.describe "AlbumImages", type: :request do
  describe "GET /album_images" do
    it "works! (now write some real specs)" do
      get album_images_path
      expect(response).to have_http_status(200)
    end
  end
end
