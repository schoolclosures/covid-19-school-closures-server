class SubscriptionsController < ApplicationController

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

private

   def subscription_params
      params.require(:subscription).permit(:email)
   end



end