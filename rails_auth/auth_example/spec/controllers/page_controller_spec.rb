require 'rails_helper'

RSpec.describe PageController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #secret" do
    it "returns http success" do
      get :secret
      expect(response).to have_http_status(:success)
    end
  end

end
