Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  post 'rooms/create'
    root to: "rooms#index"
    
    resources :users
    resources :rooms do
      resources :messages
    end


    post 'rooms', to: 'rooms#create'
end
