require 'gibbon'

module Api
  module V1
    class NewsletterController < ApplicationController

      def subscribe
        begin 
          submittedEmail = params[:emailAddress]
          email_hash = Digest::MD5.hexdigest(submittedEmail)
          gibbon = Gibbon::Request.new

          gibbon.lists(ENV["MAILCHIMP_LIST_ID"])
            .members(email_hash).upsert(
              body: {email_address: submittedEmail, status: "subscribed"}
            )

          json_response({ user: submittedEmail, status: "subscribed" })
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

