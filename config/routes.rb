Rails.application.routes.draw do
<<<<<<< HEAD

    require 'sidekiq/web'
    mount Sidekiq::Web => "/sidekiq"



=======
    namespace 'api' do
        namespace 'v1' do
            resources :volunteers, except: :index
        end
    end
>>>>>>> 0e1c291132d27c8700c57c967df2b1164c99ad01
    get 'volunteers', to: 'volunteers#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get '/subscriptions', to: "subscriptions#index"
    post '/subscriptions', to: "subscriptions#create"
    delete '/subscriptions/', to: "subscriptions#destroy"

end
