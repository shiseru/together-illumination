Rails.application.routes.draw do
  get 'illuminations/update_db'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :rooms#, only: [:show, :destroy]
  post 'rooms/:id/create_message' => 'rooms#create_message'
  post 'rooms/:owner_id/:participant_id/:post_id/create' => 'rooms#create'

  resources :posts

  get '/' => 'home#top'
  get '/home/show' => 'home#show'
  get '/about' => 'home#about'
  get '/mypage' => 'home#mypage'

  get '/update_db' => 'illuminations#update_db'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end