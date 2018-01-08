Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/logout' => 'sessions#destroy', :as => :logout

  resources :favorite
end
