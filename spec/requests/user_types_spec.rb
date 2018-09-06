require 'rails_helper'

RSpec.describe "UserTypes", type: :request do
  describe "GET /user_types" do
    it "works! (now write some real specs)" do
      get user_types_path
      expect(response).to have_http_status(200)
    end
  end
end
