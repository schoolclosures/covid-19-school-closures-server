require 'rails_helper'

RSpec.describe 'Volunteers API', type: :request do
  describe 'GET /volunteers' do
    before { get '/volunteers' }

    it 'should return a list of volunteers' do
      expect(json).not_to be_empty
    end

    it 'should return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end