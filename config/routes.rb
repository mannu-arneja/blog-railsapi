Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    get '/ping', to: 'posts#ping'
    resources :posts, only: [:index]
  end

end
