Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :posts, only: [:index]
    get '/ping', to: 'posts#ping'
  end

end
