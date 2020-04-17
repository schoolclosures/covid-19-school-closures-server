class VolunteerController < ApplicationController
  def index
    volunteers = fetchVolunteerJson;
    render json: volunteers, status: :ok, serializer: Volunteer
    json_response(volunteers)
  end

  private

  def fetchVolunteerJson
    records = AIRTABLE_VOLUNTEERS_TABLE.all(:sort => ['Description', :asc])
  end
end
