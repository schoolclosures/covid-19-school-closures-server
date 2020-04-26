class SubscriptionsController < ApplicationController
    before_action :find_subscription, only:[:destroy]

    def index
        render json: { message: 'Hashes of data will get converted to JSON' }
    end

    def create
        subscription = Subscription.create(subscription_params)
        if subscription.save
            render json: subscription
        else
            render json: {error: "Sorry, please try again."}
        end
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