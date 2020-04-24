Rails.application.routes.draw do
<<<<<<< HEAD
    namespace 'api' do
        namespace 'v1' do
            resources :volunteers, except: :index
        end
    end
    get 'volunteers', to: 'volunteers#get'
=======
    get 'volunteers', to: 'volunteers#index'
>>>>>>> 803fac90a6390a67300376960ab621f0bc7feb87
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
