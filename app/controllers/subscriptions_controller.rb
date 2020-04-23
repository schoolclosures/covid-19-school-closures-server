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

    def destroy
        subscription = Subscription.find_by email: subscription_params[:email]
        if subscription
            if subscription.destroy
               render json: subscription
            else
                render json: {error: "Delete failed."}
            end
        else
            render json: {error: "Cannot find the subscription."}
        end
    end

private

   def subscription_params
      params.require(:subscription).permit(:email)
   end



end