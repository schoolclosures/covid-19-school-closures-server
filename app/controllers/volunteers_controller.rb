class VolunteersController < ApplicationController
  def index
    volunteers = fetchVolunteerJson;
    render json: volunteers, status: :ok, serializer: VolunteerSerializer
    # json_response(volunteers)
  end

  private

  def fetchVolunteerJson
    records = AIRTABLE_VOLUNTEERS_TABLE.all(:sort => ['Description', :asc])
  end
end
