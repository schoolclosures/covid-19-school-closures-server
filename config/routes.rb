Rails.application.routes.draw do

    namespace 'api' do
        namespace 'v1' do
            resources :volunteers, except: :index
        end
    end

    namespace 'api' do
        namespace 'v1' do
            resources :subscriptions, only: [:create,:index, :destroy]
        end
    end


    


    get 'volunteers', to: 'volunteers#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get '/subscriptions', to: "subscriptions#index"
    post '/subscriptions', to: "subscriptions#create"
    delete '/subscriptions/', to: "subscriptions#destroy"

end
