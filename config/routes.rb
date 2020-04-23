Rails.application.routes.draw do
    get 'volunteers', to: 'volunteers#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get '/subscriptions', to: "subscriptions#index"
    post '/subscriptions', to: "subscriptions#create"
    delete '/subscriptions/:id', to: "subscriptions#destroy"

end
