class VolunteersController < ApplicationController
  def index
    volunteers = fetchVolunteerJson;
    json_response(volunteers)
  end

  private

  def fetchVolunteerJson
    records = AIRTABLE_VOLUNTEERS_TABLE.all(:sort => ['Description', :asc], :limit => 40)
  end
end
