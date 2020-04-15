require 'net/http'

class VolunteersController < ApplicationController
  def index
    volunteers = fetchVolunteerJson;
    json_response(volunteers)
  end

  private

  def fetchVolunteerJson
    uri = URI(ENV["VOLUNTEERS_AIRTABLE_URL"])
    uri.query = "view=Grid%20view"
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {"Authorization" => "Bearer #{ENV["AIRTABLE_API_KEY"]}"})
    response = http.request(request)
    return JSON.parse(response.body)
  end
end
