Rails.application.routes.draw do
    get 'volunteers', to: 'volunteers#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resource :subscriptions, only: [:create, :send, :destroy]

end
