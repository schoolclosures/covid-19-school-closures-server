require 'rails_helper'

RSpec.describe "Newsletters", type: :request do

  describe "GET /subscribe" do
    it "returns http success" do
      get "/newsletter/subscribe"
      expect(response).to have_http_status(:success)
    end
  end

end
