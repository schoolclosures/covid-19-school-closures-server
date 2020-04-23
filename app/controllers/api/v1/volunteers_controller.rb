require 'net/http'
module Api
  module V1
    class VolunteersController < ApplicationController
      def show
        volunteer = Volunteer.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded volunteer', data: volunteer }, status: :ok
      end

      def create
        volunteer = Volunteer.new(volunteer_params)

        if volunteer.save
          render json: { status: 'SUCCESS', message: 'Created volunteer', data: volunteer }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Volunteer not saved', data: volunteer.errors }, status: :unprocessable_entity
        end
      end

      def update
        volunteer = Volunteer.find(params[:id])

        if volunteer.update(volunteer_params)
          render json: { status: 'SUCCESS', message: 'Updated volunteer', data: volunteer }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Volunteer not updated', data: volunteer.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        volunteer = Volunteer.find(params[:id])
        volunteer.destroy

        render json: { status: 'SUCCESS', message: 'Deleted volunteer', data: volunteer }, status: :ok
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
