Rails.application.routes.draw do
    namespace 'api' do
        namespace 'v1' do
            resources :volunteers, except: :index
        end
    end
    # get 'volunteers', to: 'volunteers#get'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
