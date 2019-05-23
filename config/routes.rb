Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :transactions
      get '/test' , controller: 'transactions' , action:'test'
    end
  end
end