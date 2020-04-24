require 'net/http'
module Api
  module V1
    class VolunteersController < ApplicationController
      include Response
      include ExceptionHandler

      def show
        json_response(find_volunteer)
      end

      def create
        json_response(Volunteer.create!(volunteer_params))
      end

      def update
        json_response(find_volunteer.update!(volunteer_params))
      end

      def destroy
        find_volunteer.destroy!
        head :no_content
      end

      def get
        volunteers_json = fetchVolunteerJson;

        respond_to do |format|
          format.json do
            render(json: volunteers_json)
          end
        end
      end

      private

      def find_volunteer
        Volunteer.find(params[:id])
      end

      def volunteer_params
        params.require(:volunteer).permit(:image_url, :name, :job_desc)
      end

      def fetchVolunteerJson()
        uri = URI(ENV[VOLUNTEERS_AIRTABLE_URL])
        uri.query = "view=Grid%20view"
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.path, {"Authorization" => "Bearer #{ENV["AIRTABLE_API_KEY"]}"})
        response = http.request(request)
        return JSON.parse(response.body)
      end
    end
  end
end
