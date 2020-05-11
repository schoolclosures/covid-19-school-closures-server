Rails.application.routes.draw do
    namespace 'api' do
        namespace 'v1' do
            resources :volunteers, except: :index

            post 'newsletter/subscribe', to: 'newsletter#subscribe'
        end
    end
    get 'volunteers', to: 'volunteers#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
