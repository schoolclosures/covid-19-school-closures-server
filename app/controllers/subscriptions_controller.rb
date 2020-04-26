class SubscriptionsController < ApplicationController
    before_action :find_subscription, only:[:destroy]

    def index
        #not sure if you want me to do it through airtable too or not but if so can you give me the airtable password or do you want me to apply for mine?
        subscriptions = Subscription.all 
        json_response(subscription) 
    end

    def create
        subscription = Subscription.create!(subscription_params)
        json_response(subscription)
    end

    def destroy
        @subscription.destroy
        head :no_content
    end

    def send
      ReportWorker.perform_async()
      render json: {message: "Thanks for subscribing."}
    end

   private

   def find_subscription
     @subscription = Subscription.find_by!(email: params[:email])
   end

   def subscription_params
      params.require(:subscription).permit(:email)
   end

end