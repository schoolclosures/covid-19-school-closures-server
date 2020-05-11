require 'gibbon'

module Api
  module V1
    class NewsletterController < ApplicationController
      Gibbon::Request.api_key = "a6b1f36972f29e40e9fab68f43cea585"

      def subscribe
        # Call Mailchimp API with new e-mail address
        # Return success if added
        begin 
          submittedEmail = params[:emailAddress]
          email_hash = Digest::MD5.hexdigest(submittedEmail)
          # gibbon = Gibbon::Request.new(api_key: ENV["MAILCHIMP_API_KEY"])
          gibbon = Gibbon::Request.new(api_key: "a6b1f36972f29e40e9fab68f43cea585")
          gibbon.lists(ENV["MAILCHIMP_LIST_ID"])
            .members(email_hash).upsert(
              body: {email_address: submittedEmail, status: "subscribed"}
            )

          json_response(submittedEmail)
        rescue => error
          p "Subscribe error: #{error}"
          render json: {
            error: "Error connecting to Mailchimp",
          }, status: 400   
        end   
      end

      def subscribe_params
        params.require(:emailAddress)
      end
    end
  end
end

