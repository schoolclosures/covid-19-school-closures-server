require 'net/http'
module Api
  module V1
    class VolunteersController < ApplicationController
      before_action :find_volunteer, only: %i[show update destroy]

      def show
        json_response(@volunteer)
      end

      def create
        volunteer = Volunteer.create!(volunteer_params)
        json_response(volunteer) 
      end

      def update
        @volunteer.update!(volunteer_params)
        head :no_content
      end

      def destroy
        @volunteer.destroy
        head :no_content
      end

      def index
        volunteers = fetchVolunteerJson
        json_response(volunteers)
      end

      private

      def find_volunteer
        @volunteer = Volunteer.find_by!(id: params[:id])
      end

      def volunteer_params
        params.require(:volunteer).permit(:image_url, :name, :job_desc)
      end

      def fetchVolunteerJson
        records = AIRTABLE_VOLUNTEERS_TABLE.all(:sort => ['Description', :asc], :limit => 40)
      end
    end
  end
end
