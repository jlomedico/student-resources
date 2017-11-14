require 'rails_helper'

RSpec.describe "Babysitters", type: :request do
  describe "GET /babysitters" do
    it "works! (now write some real specs)" do
      get babysitters_path
      expect(response).to have_http_status(200)
    end
  end
end
