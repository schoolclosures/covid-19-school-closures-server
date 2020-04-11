require 'net/http'

class VolunteersController < ApplicationController
  def get
    uri = URI(Rails.application.config.VOLUNTEERS_AIRTABLE)
    uri.query = "view=Grid%20view"
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {"Authorization" => "Bearer #{ENV["AIRTABLE_API_KEY"]}"})
    response = http.request(request)
    volunteers_json = JSON.parse(response.body)

    respond_to do |format|
        format.json do
            render(json: volunteers_json)
        end
    end
  end
end
