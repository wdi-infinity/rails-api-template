require 'rails_helper'

RSpec.describe "Photographers", type: :request do
  describe "GET /photographers" do
    it "works! (now write some real specs)" do
      get photographers_path
      expect(response).to have_http_status(200)
    end
  end
end
